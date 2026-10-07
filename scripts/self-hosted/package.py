#!/usr/bin/env python3
"""Build a data-free source distribution using an explicit allowlist."""
from pathlib import Path
import argparse,re,zipfile
root=Path(__file__).resolve().parents[2]
parser=argparse.ArgumentParser();parser.add_argument('--out',required=True);args=parser.parse_args()
files=[]
for directory in ['app','components','lib','public','supabase/migrations','scripts/ingest','scripts/self-hosted','tests/self-hosted']:
 files += [p for p in (root/directory).rglob('*') if p.is_file() and not any(x in p.parts for x in ['node_modules','.next','.git']) and p.suffix not in ['.tsbuildinfo'] and p.name != 'package.py']
for name in ['package.json','package-lock.json','tsconfig.json','next-env.d.ts','next.config.mjs','postcss.config.mjs','middleware.ts','.env.example','.env.bootstrap.example','.gitignore','.dockerignore','Dockerfile','compose.yaml','LICENSE','SELF-HOSTED.md','tests/events/events.test.cjs']:
 files.append(root/name)
entries={str(p.relative_to(root)):p.read_bytes() for p in files}
entries['README.md']=(root/'SELF-HOSTED.md').read_bytes()
workflow=(root/'.github/workflows/ingest.yml').read_text()
workflow=re.sub(r'  schedule:\n    - cron:.*\n','',workflow)
entries['.github/workflows/ingest.yml']=workflow.encode()
for name,data in entries.items():
 if name.startswith('supabase/migrations/'):
  data=data.replace(b'CRA events',b'Internal events');entries[name]=data
 if re.search(rb'CyberRisk Alliance|\bCRA\b|Identiverse|InfoSec World|MSSP Alert|ChannelPro|Cybersecurity Summit|mattsimoto|lggxilzhgqcptvyzqiqr|b7df7779-1c40-4878-8711-ae1ccdcbf1b4|competitive-intel-platform\.vercel\.app',data,re.I):
  raise SystemExit('Private installation reference found in '+name)
 if re.search(rb'eyJ[A-Za-z0-9_-]{30,}\.[A-Za-z0-9_-]{30,}|gsk_[A-Za-z0-9]{20,}|sk-ant-[A-Za-z0-9_-]{20,}',data):
  raise SystemExit('Possible credential found in '+name)
out=Path(args.out).resolve();out.parent.mkdir(parents=True,exist_ok=True)
with zipfile.ZipFile(out,'w',zipfile.ZIP_DEFLATED) as archive:
 for name,data in sorted(entries.items()):archive.writestr('competitive-intelligence-white-label/'+name,data)
print(f'Created {out.name}: {len(entries)} files, no installation data or Git history.')
