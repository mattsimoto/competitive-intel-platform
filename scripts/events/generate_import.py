"""Generate an atomic, repeat-safe SQL import from the preserved calendar JSON.

Usage: python scripts/events/generate_import.py --org <organization uuid> > /tmp/events.sql
No keys, generated database IDs, or tenant names are embedded in the source.
Apply the events migration first. A repeated import does not overwrite reviews.
"""
import argparse
import json
import re
import uuid
from pathlib import Path

ROOT = Path(__file__).resolve().parent
PORTFOLIO = {
    'Cybersecurity Summit': 'Regional one-day events connecting senior cybersecurity practitioners, CISOs, technology providers, and information-security experts.',
    'CyberRisk Collaborative': 'CISO community, leadership exchanges, executive development, and peer networking for cybersecurity leaders.',
    'Identiverse': 'Digital identity, IAM, identity security, privacy, and trust professionals and solution providers.',
    'InfoSec World': 'Cybersecurity practitioners and leaders seeking professional education, technical insight, and solution discovery.',
    'MSSP Alert Live': 'MSSP leaders, managed security providers, and partners seeking security business growth and operational insights.',
    'ChannelPro events': 'MSPs, IT consultants, solution providers, and channel partners seeking technical and business education.',
}
def proposals(row):
    text = (row['Event Name'] + ' ' + str(row.get('Industry Focus') or '')).lower()
    proposals = []
    def add(name, kind, reason):
        proposals.append({'name': name, 'type': kind, 'rationale': 'Proposed analyst inference from the imported event focus: ' + reason + ' Attendance, sponsor budgets, and actual substitution have not been validated.'})
    vendor = bool(re.search(r'palo alto|fortinet|microsoft|bluehat|cisco live|crowdstrike|splunk|re:invent', text))
    niche = bool(re.search(r'government|defen[cs]e|privacy|physical|cloud.native|academic|financial|incident.response', text))
    if re.search(r'identity|\biam\b|authentication', text):
        add('Identiverse', 'partial', 'Identity programming may overlap with Identiverse’s professional audience and sponsor demand.')
    add('InfoSec World', 'adjacent' if niche else 'partial' if vendor else 'direct', 'Cybersecurity education and solution discovery may compete for practitioner attention, travel, and sponsorship budgets; breadth and format differ.')
    if re.search(r'ciso|executive|leadership|risk management|rsa conference|rsac|billington|cybertech|incyber', text):
        add('Cybersecurity Summit', 'partial', 'Security leadership and vendor engagement may overlap with the regional summit audience; geography and multi-day formats need review.')
        add('CyberRisk Collaborative', 'adjacent' if niche or vendor else 'partial', 'Senior security networking may overlap with CRC leadership exchanges and peer communities; membership value is not equivalent to conference attendance.')
    if re.search(r'mssp|managed.security', text):
        add('MSSP Alert Live','partial','Managed security provider programming may address the same business and operations audience.')
    if re.search(r'\bmsp\b|channel|partner',text) or re.search(r'fortinet accelerate|cisco live',text):
        add('ChannelPro events','adjacent' if vendor else 'partial','Partner or channel education may overlap with MSP and solution-provider programming; a verified channel audience is required.')
    return proposals

def prepare():
    rows=json.loads((ROOT/'calendar-2027.json').read_text())
    manifest=json.loads((ROOT/'organizers-2027.json').read_text())
    owners={row:owner for owner in manifest['owners'] for row in owner['rows']}
    internal=set(manifest['internal_rows'])
    assert len(rows)==126 and len({r['source_row'] for r in rows})==126
    assert not owners.keys() & internal
    prepared=[]
    for row in rows:
        n=row['source_row']
        def date(key):
            value=row.get(key)
            if value is not None and not re.fullmatch(r'\d{4}-\d{2}-\d{2}',str(value)): raise ValueError(f'Unexpected date at row {n}: {value}')
            return value
        prepared.append({'key':f'calendar-2027-row-{n}','row':n,'name':row['Event Name'],'start':date('Start Date'),'end':date('End Date'),
          'date_status':row['Date Status'],'city':row.get('City / Venue Market'),'country':row.get('Country'),'region':row.get('Region'),
          'focus':row.get('Industry Focus'),'website':row.get('Website'),'sources':list(dict.fromkeys(re.findall(r'https?://[^\s;]+',str(row.get('Source URL(s)') or '')))),
          'raw':row,'owner':owners.get(n),'internal':('Identiverse' if n==45 else 'InfoSec World' if n==70 else 'Cybersecurity Summit') if n in internal else None,
          'matches':[] if n in internal else proposals(row)})
    return prepared

def sql_literal(value): return "'"+json.dumps(value,ensure_ascii=False).replace("'","''")+"'::jsonb"

def main():
    parser=argparse.ArgumentParser(); parser.add_argument('--org',required=True); args=parser.parse_args()
    org=str(uuid.UUID(args.org))
    events=prepare()
    print('begin;')
    print('create temporary table event_import_payload(data jsonb) on commit drop;')
    print('insert into event_import_payload values('+sql_literal(events)+');')
    print('create temporary table event_import_portfolio(data jsonb) on commit drop;')
    print('insert into event_import_portfolio values('+sql_literal(PORTFOLIO)+');')
    print("""
do $import$
declare
  v_org uuid := '%s'; item jsonb; owner jsonb; match jsonb; entry record;
  v_company uuid; v_parent uuid; v_product uuid; v_internal uuid; v_event uuid;
  v_category uuid; v_website_type uuid; v_event_type uuid; v_name text;
begin
  if not exists(select 1 from public.organizations where id=v_org) then raise exception 'Unknown organization'; end if;
  select id into v_category from public.product_categories where organization_id=v_org and name='Conferences' limit 1;
  select id into v_website_type from public.source_types where organization_id=v_org and name='Website' limit 1;
  select id into v_event_type from public.source_types where organization_id=v_org and name='Event Calendar' limit 1;
  for entry in select key,value from jsonb_each_text((select data from event_import_portfolio)) loop
    insert into public.internal_products(organization_id,name,product_category_id,description,audience_description,geography)
    values(v_org,entry.key,v_category,'CRA event portfolio. Official brand documentation: https://www.cyberriskalliance.com/brands',entry.value,'Global')
    on conflict(organization_id,name) do nothing;
  end loop;
  for item in select value from jsonb_array_elements((select data from event_import_payload)) loop
    if exists(select 1 from public.industry_events where organization_id=v_org and import_key=item->>'key') then continue; end if;
    v_company:=null; v_parent:=null; v_product:=null; v_internal:=null;
    owner:=item->'owner';
    if item->>'internal' is not null then
      select id into v_internal from public.internal_products where organization_id=v_org and name=item->>'internal';
    elsif owner is not null and owner<>'null'::jsonb then
      v_name:=owner->>'name';
      select id into v_company from public.companies where organization_id=v_org and
        (lower(name)=lower(v_name) or name in(select jsonb_array_elements_text(owner->'aliases'))) order by created_at,id limit 1;
      if v_company is null then
        insert into public.companies(organization_id,name,normalized_name,website_url,description,intelligence_status,original_import_reference)
        values(v_org,v_name,lower(regexp_replace(trim(v_name),'\\s+',' ','g')),owner->>'website',owner->>'notes','pending_review','2027 event calendar: documented organizer') returning id into v_company;
      end if;
      if owner->>'parent' is not null then
        select id into v_parent from public.companies where organization_id=v_org and lower(name)=lower(owner->>'parent') order by created_at,id limit 1;
        if v_parent is null then
          insert into public.companies(organization_id,name,normalized_name,website_url,intelligence_status,original_import_reference)
          values(v_org,owner->>'parent',lower(owner->>'parent'),owner->>'parent_url','pending_review','2027 event organizer parent; see linked event evidence') returning id into v_parent;
        end if;
        update public.companies set parent_company_id=v_parent where id=v_company and parent_company_id is null;
        if not exists(select 1 from public.company_sources where organization_id=v_org and company_id=v_parent and url=owner->>'url') then
          insert into public.company_sources(organization_id,company_id,source_type_id,name,url,priority) values(v_org,v_parent,v_website_type,'Event brand ownership evidence',owner->>'url',1);
        end if;
      end if;
      if not exists(select 1 from public.company_sources where organization_id=v_org and company_id=v_company and url=owner->>'url') then
        insert into public.company_sources(organization_id,company_id,source_type_id,name,url,priority) values(v_org,v_company,v_website_type,'Event organizer evidence',owner->>'url',1);
      end if;
      if item->>'website' is not null and not exists(select 1 from public.company_sources where organization_id=v_org and company_id=v_company and url=item->>'website') then
        insert into public.company_sources(organization_id,company_id,source_type_id,name,url) values(v_org,v_company,v_event_type,item->>'name',item->>'website');
      end if;
      insert into public.products(organization_id,company_id,name,normalized_name,product_category_id,description,product_url,audience_description,geography,intelligence_status,original_import_reference)
      values(v_org,v_company,item->>'name',lower(item->>'name')||' | '||(item->>'key'),v_category,item->>'focus',item->>'website',item->>'focus',item->>'country','pending_review','Cybersecurity Industry Events 2027.xlsx row '||(item->>'row')) returning id into v_product;
    end if;
    insert into public.industry_events(organization_id,import_key,name,start_date,end_date,date_status,city,country,region,industry_focus,website_url,source_urls,raw_fields,source_workbook,source_row,scope,organizer_name,organizer_company_id,organizer_status,owner_evidence_url,owner_notes,owner_verified_at,product_id,internal_product_id)
    values(v_org,item->>'key',item->>'name',(item->>'start')::date,(item->>'end')::date,item->>'date_status',item->>'city',item->>'country',item->>'region',item->>'focus',item->>'website',item->'sources',item->'raw','Cybersecurity Industry Events 2027 (1).xlsx',(item->>'row')::integer,
      case when v_internal is not null then 'internal' when v_company is not null then 'external' else 'unresolved' end,
      case when v_internal is not null then 'CyberRisk Alliance' else owner->>'name' end,v_company,
      case when v_internal is not null or v_company is not null then 'verified' else 'pending' end,
      case when v_internal is not null then 'https://www.cyberriskalliance.com/brands' else owner->>'url' end,
      case when v_internal is not null then 'CRA official brand and event portfolio identifies this as an internal event.' when v_company is not null then owner->>'notes' else 'Calendar row imported. Actual producing entity, co-organizers, and any parent company require official evidence. No competitor product or approved relationship created yet.' end,
      case when v_internal is not null or v_company is not null then now() else null end,v_product,v_internal) returning id into v_event;
    for match in select value from jsonb_array_elements(item->'matches') loop
      insert into public.event_portfolio_matches(organization_id,event_id,internal_product_id,relationship_type,rationale)
      select v_org,v_event,id,(match->>'type')::public.relationship_type,match->>'rationale' from public.internal_products where organization_id=v_org and name=match->>'name';
    end loop;
  end loop;
end $import$;
commit;
select scope,organizer_status,count(*) from public.industry_events where organization_id='%s' group by scope,organizer_status order by scope;
""" % (org,org))

if __name__=='__main__': main()
