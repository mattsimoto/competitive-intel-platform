-- Seed data for the Competitive Intelligence Platform.
-- Paste into the Supabase SQL Editor AFTER running migrations 0001-0003.
-- Every record is confidence 60 / pending_review (Needs Verification).
begin;
insert into organizations (id, name, slug) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Your Org', 'your-org');

-- Customers (deduped across companies).
insert into customers (id, organization_id, name, normalized_name) values ('a9c839ad-fc0f-45f6-9c4c-0af375252c63', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Keyfactor PadSplit', 'keyfactor padsplit');
insert into customers (id, organization_id, name, normalized_name) values ('949aca03-774b-4648-80b6-b54bf02bbc09', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Sera', 'sera');
insert into customers (id, organization_id, name, normalized_name) values ('09657cfd-30ea-424b-b8f8-c737184a2365', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Source2', 'source2');
insert into customers (id, organization_id, name, normalized_name) values ('97bca7d5-9bd4-401a-a195-9fc4d1531fc7', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Cyolo', 'cyolo');
insert into customers (id, organization_id, name, normalized_name) values ('858cb566-98f1-4d9d-b93b-fd1b7b31f77f', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Star Wars', 'star wars');
insert into customers (id, organization_id, name, normalized_name) values ('a7cdd01a-d3dd-45f6-a099-3562c770596f', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Myers-Briggs', 'myers briggs');
insert into customers (id, organization_id, name, normalized_name) values ('47285db9-9dbf-4259-bc69-95315d9f4964', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Halo', 'halo');
insert into customers (id, organization_id, name, normalized_name) values ('f9956869-c416-49a5-8d48-0d91a14ee07d', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'BroadCom', 'broadcom');
insert into customers (id, organization_id, name, normalized_name) values ('1d820768-9d09-44ba-bafc-83b9d82d5c17', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'CyberArk', 'cyberark');
insert into customers (id, organization_id, name, normalized_name) values ('59435453-fbf3-4359-9c20-431f10d56320', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Gigamon', 'gigamon');
insert into customers (id, organization_id, name, normalized_name) values ('813a1ecb-4ff2-4900-9e4d-58a7bad82f1f', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'imperva', 'imperva');
insert into customers (id, organization_id, name, normalized_name) values ('54e3b749-3097-4945-a3c4-7e1359d484b1', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ISC2', 'isc2');
insert into customers (id, organization_id, name, normalized_name) values ('2a174ebd-72da-45d7-aa61-620133a9db64', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'LogRhythm', 'logrhythm');
insert into customers (id, organization_id, name, normalized_name) values ('0acf73c1-8b03-4953-a79c-d52db33cf2ff', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Palo Alto', 'palo alto');
insert into customers (id, organization_id, name, normalized_name) values ('4821a260-513d-4865-baae-faf76b7431a5', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Recorded Future', 'recorded future');
insert into customers (id, organization_id, name, normalized_name) values ('80528204-0dba-4c59-a688-d94efa69eb70', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Rapid1', 'rapid1');
insert into customers (id, organization_id, name, normalized_name) values ('33c80466-f9a9-4f6c-b5f7-8b4052178728', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Splunk', 'splunk');
insert into customers (id, organization_id, name, normalized_name) values ('8a575d0a-a584-45a8-a92c-b1329d89c832', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Trend Micro', 'trend micro');
insert into customers (id, organization_id, name, normalized_name) values ('67e5f47e-cf24-4258-873b-7692ab683b0c', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Thycotic', 'thycotic');
insert into customers (id, organization_id, name, normalized_name) values ('cf84ea12-a432-49e2-9b3d-bc2274390a7f', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Cisco', 'cisco');
insert into customers (id, organization_id, name, normalized_name) values ('31d2169c-e0a9-47dc-961e-5de83dc4dfc5', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Gusto', 'gusto');
insert into customers (id, organization_id, name, normalized_name) values ('2e795138-8d32-43fd-94a5-1c7d2f0214f0', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'VTS', 'vts');
insert into customers (id, organization_id, name, normalized_name) values ('a324a2e5-4dff-41da-965b-8ebd9c7f1293', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Dropbox', 'dropbox');
insert into customers (id, organization_id, name, normalized_name) values ('cc6d0964-688a-497e-9f49-245e21e58ceb', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Vitaly', 'vitaly');
insert into customers (id, organization_id, name, normalized_name) values ('3eae4626-2160-4cdb-b87a-0e1175c75b7b', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ClickUp', 'clickup');
insert into customers (id, organization_id, name, normalized_name) values ('c7f96765-794d-4d20-8e44-e457d219846f', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Gorgias', 'gorgias');
insert into customers (id, organization_id, name, normalized_name) values ('1c0a5d73-f765-472c-bb3d-c04a82a7cebc', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Intuit', 'intuit');
insert into customers (id, organization_id, name, normalized_name) values ('d16441aa-accc-4244-8a8c-89c730be2fe9', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Google', 'google');
insert into customers (id, organization_id, name, normalized_name) values ('8d8f24e9-44b9-4610-8133-35273e9e53b4', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'AWS', 'aws');
insert into customers (id, organization_id, name, normalized_name) values ('746de778-bbb8-4d95-8e1f-48f7df4cc191', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'IBM', 'ibm');
insert into customers (id, organization_id, name, normalized_name) values ('650fa531-9cd5-4837-a3c1-237c183be018', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Dell', 'dell');
insert into customers (id, organization_id, name, normalized_name) values ('26178b2a-c8e9-4f11-8286-9aea9346a7ea', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'GitLab', 'gitlab');
insert into customers (id, organization_id, name, normalized_name) values ('3c7d1d98-2e10-4a82-b872-9d80438ede76', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'RedHat', 'redhat');
insert into customers (id, organization_id, name, normalized_name) values ('ed04e3b5-ea79-41db-93b7-0db3c2e7fb52', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'CloudBees', 'cloudbees');
insert into customers (id, organization_id, name, normalized_name) values ('5201cab1-37c2-4417-bfee-47771c03b9d8', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Tricentis', 'tricentis');
insert into customers (id, organization_id, name, normalized_name) values ('62f480fc-75fd-4acf-9244-87586a31ccb7', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Prisma', 'prisma');
insert into customers (id, organization_id, name, normalized_name) values ('0a22b468-825d-4a17-ac0f-b980d973eda7', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'PaloAlto', 'paloalto');
insert into customers (id, organization_id, name, normalized_name) values ('417e5cc4-269b-46ee-aebb-25501f410dc2', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Harness', 'harness');
insert into customers (id, organization_id, name, normalized_name) values ('31c59e6f-123b-4d2d-b313-7de9d0f12301', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'LightStep', 'lightstep');
insert into customers (id, organization_id, name, normalized_name) values ('0ad6ea93-e1cc-44ed-bf9e-7b388769d8cf', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Mend', 'mend');
insert into customers (id, organization_id, name, normalized_name) values ('b39186d0-88ca-4682-ae00-88d8c87eb3d9', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'DeployHub', 'deployhub');
insert into customers (id, organization_id, name, normalized_name) values ('58116972-f1ba-4760-9d93-3b588c1d21cc', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Instana', 'instana');
insert into customers (id, organization_id, name, normalized_name) values ('90b7d717-b4b3-40eb-8fb1-2e8589f88e57', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Vericode', 'vericode');
insert into customers (id, organization_id, name, normalized_name) values ('e3287b9b-3a65-4abd-a99e-79aa06565af7', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Snyk', 'snyk');
insert into customers (id, organization_id, name, normalized_name) values ('7bb656ba-6f6f-4bb2-bebc-d99d9e72f98c', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Zscaler', 'zscaler');
insert into customers (id, organization_id, name, normalized_name) values ('88840583-7d89-4030-976e-707f7b18fb09', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'RSA Conference', 'rsa conference');
insert into customers (id, organization_id, name, normalized_name) values ('d86fb73c-7915-4b07-898c-77dcbe2d1013', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Atlassian', 'atlassian');
insert into customers (id, organization_id, name, normalized_name) values ('9e3b5e7e-3ff7-42c4-b491-088342a35abd', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Sumo Logic', 'sumo logic');
insert into customers (id, organization_id, name, normalized_name) values ('43fea395-fcec-495b-9780-4dbbe1fef7eb', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'etc.', 'etc');
insert into customers (id, organization_id, name, normalized_name) values ('3f4095e5-7f8f-4d24-aead-eccee2098fe7', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Oracle', 'oracle');
insert into customers (id, organization_id, name, normalized_name) values ('9b602935-efae-408b-be2d-527dc2c29947', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Oracle Netsuite', 'oracle netsuite');
insert into customers (id, organization_id, name, normalized_name) values ('2e4a7ed1-2469-4cdd-b195-a4c7f9b91ca4', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Bronto', 'bronto');
insert into customers (id, organization_id, name, normalized_name) values ('07eee21b-bb52-407a-9f10-89b73e505941', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Comodo', 'comodo');
insert into customers (id, organization_id, name, normalized_name) values ('df22d231-4c0b-4072-b383-9d102978790c', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ForcePoint', 'forcepoint');
insert into customers (id, organization_id, name, normalized_name) values ('921b721a-747e-4bb9-b91e-ece03e4fec36', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'NewsCred', 'newscred');
insert into customers (id, organization_id, name, normalized_name) values ('74e86913-1ffc-4e9d-9ed8-74bb692cd398', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Abacus Next', 'abacus next');
insert into customers (id, organization_id, name, normalized_name) values ('fdd03d6f-347c-472f-8115-d7edadd3419f', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Adaptiva', 'adaptiva');
insert into customers (id, organization_id, name, normalized_name) values ('2d72cbd6-a41a-4e34-baad-33ffa9715a12', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'CloudReach', 'cloudreach');
insert into customers (id, organization_id, name, normalized_name) values ('e9913e1c-0a3b-4880-b738-2a371fe31756', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Samsung', 'samsung');
insert into customers (id, organization_id, name, normalized_name) values ('29cfae5e-c5ba-4997-8bdc-4e2dc240be93', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Seagate', 'seagate');
insert into customers (id, organization_id, name, normalized_name) values ('dea35ed4-11e5-4f4c-b074-5cb75c645507', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Service Channel', 'service channel');
insert into customers (id, organization_id, name, normalized_name) values ('5bfe6d86-ec2e-45f3-bbe5-ad2b84947e99', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Omnipresent', 'omnipresent');
insert into customers (id, organization_id, name, normalized_name) values ('941ac48b-7bf5-47c7-bca6-5f4c1805e5ef', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'OpenText', 'opentext');
insert into customers (id, organization_id, name, normalized_name) values ('a817dc99-1bb9-444e-889f-fdeb5fefe3b5', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Dynatrace', 'dynatrace');
insert into customers (id, organization_id, name, normalized_name) values ('5fde5c22-3fe6-4e43-b643-2db049b7fa03', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Roadmaster Drivers School', 'roadmaster drivers school');
insert into customers (id, organization_id, name, normalized_name) values ('34895802-05a6-4e64-b28b-118dc49de61b', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Open Dealer Exchange (ODE)', 'open dealer exchange ode');
insert into customers (id, organization_id, name, normalized_name) values ('0c1075a8-0fb9-4b83-bbcb-fe721bfd3c88', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'StoreConnect', 'storeconnect');
insert into customers (id, organization_id, name, normalized_name) values ('8066c13e-afff-43a4-99c2-7586ee9282c4', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Jeeva Informatics', 'jeeva informatics');
insert into customers (id, organization_id, name, normalized_name) values ('3b1128fa-26ff-4019-9d4e-af4d730e03d3', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Novus Detox', 'novus detox');
insert into customers (id, organization_id, name, normalized_name) values ('00734091-02da-45f0-9662-3219068396e1', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Condusiv Technologies', 'condusiv technologies');
insert into customers (id, organization_id, name, normalized_name) values ('d80e9886-a87f-4124-b250-92e4c5a296fa', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Consumer Energy Solutions (CEW)', 'consumer energy solutions cew');
insert into customers (id, organization_id, name, normalized_name) values ('7e1012df-efa6-4158-8cee-61ed684e31ea', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'NTC', 'ntc');
insert into customers (id, organization_id, name, normalized_name) values ('6de03a20-ae50-425d-a45e-e765a510ba55', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'KnowBe4', 'knowbe4');
insert into customers (id, organization_id, name, normalized_name) values ('de84d41e-e9f9-410e-87a1-14039260dce4', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Zanthion', 'zanthion');
insert into customers (id, organization_id, name, normalized_name) values ('9000f329-ce71-4ede-bda8-4be14181bfdf', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Quadrant Information Services', 'quadrant information services');
insert into customers (id, organization_id, name, normalized_name) values ('11cde1e8-a41f-4f0d-89a3-f279ddbff8d1', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'InfoBionic', 'infobionic');
insert into customers (id, organization_id, name, normalized_name) values ('e6afdc96-cfee-4a5b-b33d-0d86d71c952d', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Payscout', 'payscout');
insert into customers (id, organization_id, name, normalized_name) values ('289fcb94-125c-48d8-aaf0-9157f8396584', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Chargebacks 911', 'chargebacks 911');
insert into customers (id, organization_id, name, normalized_name) values ('bed694f2-ef86-4be1-bcbc-1b7ee48a89b6', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Technologent', 'technologent');
insert into customers (id, organization_id, name, normalized_name) values ('18f325c5-5c47-47e9-b883-4a2f3c9da9fe', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Real Intelligence LLC', 'real intelligence');
insert into customers (id, organization_id, name, normalized_name) values ('271cd2da-249d-433e-9214-7b9e8ef5c62d', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'base6sense', 'base6sense');
insert into customers (id, organization_id, name, normalized_name) values ('5114efb0-a92c-4662-8743-c56046678378', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'bombora', 'bombora');
insert into customers (id, organization_id, name, normalized_name) values ('04547c3b-dd59-4ef3-86dd-88bcc52bd3d6', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'folloze', 'folloze');
insert into customers (id, organization_id, name, normalized_name) values ('62672917-61f0-403c-90ae-39b2577cbac9', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Okta', 'okta');
insert into customers (id, organization_id, name, normalized_name) values ('569f2b90-e4d8-4ce7-9983-5a1434923a67', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Twilio', 'twilio');
insert into customers (id, organization_id, name, normalized_name) values ('2c199982-cf81-492d-b648-0f2edc21b69c', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Demandbase', 'demandbase');
insert into customers (id, organization_id, name, normalized_name) values ('08d6feef-f286-472c-82e8-99ad7d8b7b29', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Airtable', 'airtable');
insert into customers (id, organization_id, name, normalized_name) values ('250dec03-f1f6-4f78-8c49-96d8ee27db83', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Shell', 'shell');
insert into customers (id, organization_id, name, normalized_name) values ('4fa931e7-06ae-4c39-9a45-19963ff92327', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Goddard Technologies', 'goddard technologies');
insert into customers (id, organization_id, name, normalized_name) values ('45cbf116-f0c8-49b7-a379-12e4e632c8b7', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'AARP', 'aarp');
insert into customers (id, organization_id, name, normalized_name) values ('33f512e6-5b2c-4240-9f53-96ea71021c91', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'FEMA', 'fema');
insert into customers (id, organization_id, name, normalized_name) values ('4b4b2b5a-f3b5-4486-9186-9d40db1b7475', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Ad Council', 'ad council');
insert into customers (id, organization_id, name, normalized_name) values ('531d6b24-e99c-4cc3-9bd7-064394d3c427', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Rakuten', 'rakuten');
insert into customers (id, organization_id, name, normalized_name) values ('01ed0fd5-3ebb-481c-b519-fd9d2075c30b', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ADP', 'adp');
insert into customers (id, organization_id, name, normalized_name) values ('9dbb6a7e-eea4-401d-a07a-86d9c878854f', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Financial: JPMorganChase', 'financial jpmorganchase');
insert into customers (id, organization_id, name, normalized_name) values ('c5f14c75-2081-4af9-982f-6044e6948e6d', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'PNC', 'pnc');
insert into customers (id, organization_id, name, normalized_name) values ('1d82e426-5a18-456e-b60d-9141fcc7690c', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Citi', 'citi');
insert into customers (id, organization_id, name, normalized_name) values ('c2fa35ac-167a-40a9-bc64-cd2fc3dc27e5', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'HCA', 'hca');
insert into customers (id, organization_id, name, normalized_name) values ('2874ef33-bf70-46b9-95b8-0ca01f5afeb4', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'RBS', 'rbs');
insert into customers (id, organization_id, name, normalized_name) values ('161928d6-7874-4c57-928d-4c473222ff0d', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Microsoft', 'microsoft');
insert into customers (id, organization_id, name, normalized_name) values ('05cb2526-aefe-45e9-b54a-a1d5600a03bd', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Laseya', 'laseya');
insert into customers (id, organization_id, name, normalized_name) values ('c2821a45-1300-4b22-8578-975d6da7cc12', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Lenovo', 'lenovo');
insert into customers (id, organization_id, name, normalized_name) values ('c55a97f8-2434-454c-acb4-214065eb8f0e', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Synnex', 'synnex');
insert into customers (id, organization_id, name, normalized_name) values ('c8b39ef2-ce2e-41b7-a332-25aecb610034', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Citrix', 'citrix');
insert into customers (id, organization_id, name, normalized_name) values ('cfcfcf4e-0b16-41e7-b435-1cc4fe6654c3', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Connectwise', 'connectwise');
insert into customers (id, organization_id, name, normalized_name) values ('a3a56771-02a2-405f-9648-773b393969c8', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'SEMRusm', 'semrusm');
insert into customers (id, organization_id, name, normalized_name) values ('b7f1878b-ca9c-4f80-850a-605cd9a08c89', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Hubspot', 'hubspot');
insert into customers (id, organization_id, name, normalized_name) values ('8e83aeca-3248-4e78-937e-6719abeb4de0', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'WordPress', 'wordpress');
insert into customers (id, organization_id, name, normalized_name) values ('0e7133f1-3a22-4b62-9b93-c7fa57c2f325', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Platform 24', 'platform 24');
insert into customers (id, organization_id, name, normalized_name) values ('b4513c34-b8f6-4741-848f-8268b9488782', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Technology Solutions. UTah MSP', 'technology solutions utah msp');
insert into customers (id, organization_id, name, normalized_name) values ('ae7192ed-1d7a-41ea-aa23-b754641edfb7', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Itopia', 'itopia');
insert into customers (id, organization_id, name, normalized_name) values ('7ff8c932-5a1a-447e-aff9-b6a1579bcf7e', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'minereye', 'minereye');
insert into customers (id, organization_id, name, normalized_name) values ('fa62195b-a99b-4c36-b8f7-043e0299538f', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Sealights', 'sealights');
insert into customers (id, organization_id, name, normalized_name) values ('1285d84e-0202-42ce-90c5-dd278d7d36ce', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Centraleyes', 'centraleyes');
insert into customers (id, organization_id, name, normalized_name) values ('dd28c64d-0590-4b24-9078-2ff219950478', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'BreezoMeter', 'breezometer');
insert into customers (id, organization_id, name, normalized_name) values ('1c1dd324-72a3-4012-b792-dbbd9fe716a1', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Akeyless', 'akeyless');
insert into customers (id, organization_id, name, normalized_name) values ('46ef613d-2641-41f2-8496-8aeef70d0fee', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Cyberready', 'cyberready');
insert into customers (id, organization_id, name, normalized_name) values ('fae3666d-37e8-49d6-a357-cab7afded01e', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Firebolt', 'firebolt');
insert into customers (id, organization_id, name, normalized_name) values ('8bbb8f22-9f92-47b1-bda6-61407a4e269b', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Cyber Observer', 'cyber observer');
insert into customers (id, organization_id, name, normalized_name) values ('194ed601-735e-419a-9aba-1f9b4a7b3ca0', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Upsolver', 'upsolver');
insert into customers (id, organization_id, name, normalized_name) values ('5b65e3c4-3cff-4383-ba33-c936fa1fe21e', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'NetApp', 'netapp');
insert into customers (id, organization_id, name, normalized_name) values ('7408fb07-2e48-4d1d-92cc-28f9565f3f6b', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Cymulate', 'cymulate');
insert into customers (id, organization_id, name, normalized_name) values ('622584e2-2da7-4ce1-9654-c2034ee4f985', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Cycognito', 'cycognito');
insert into customers (id, organization_id, name, normalized_name) values ('1a2e7ad5-b167-4def-b31d-c8c7e7e162cf', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Cymbio', 'cymbio');
insert into customers (id, organization_id, name, normalized_name) values ('fc9bbade-8746-430e-8599-ce5db88ae160', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Secret Double Octopus', 'secret double octopus');
insert into customers (id, organization_id, name, normalized_name) values ('eaacbfd6-e01f-4c20-b26c-9152481f86f4', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Neura', 'neura');
insert into customers (id, organization_id, name, normalized_name) values ('d69e5849-604c-4c39-b82b-ae003c705afc', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Armo...', 'armo');
insert into customers (id, organization_id, name, normalized_name) values ('1b3ffd36-9f21-470a-a8ba-4d57fcbc339b', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Check Point', 'check point');
insert into customers (id, organization_id, name, normalized_name) values ('3c62ca0c-cc84-4e46-82eb-2793cfd8c440', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'NICE', 'nice');
insert into customers (id, organization_id, name, normalized_name) values ('c49c3f57-f12f-4a98-9458-41f54469e358', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Checkmarx', 'checkmarx');
insert into customers (id, organization_id, name, normalized_name) values ('765fcb41-3473-40ac-9b94-5a37560de95c', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Focused on HubSpot', 'focused on hubspot');
insert into customers (id, organization_id, name, normalized_name) values ('ec699df8-106e-433c-8a59-9d2045216998', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Amazon', 'amazon');
insert into customers (id, organization_id, name, normalized_name) values ('74f20b40-5c05-44fd-95a6-21d4b69f0427', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Disney', 'disney');
insert into customers (id, organization_id, name, normalized_name) values ('d148b75f-54de-4069-8268-ac1ae45477c5', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Toyota', 'toyota');
insert into customers (id, organization_id, name, normalized_name) values ('53dc1890-076b-45e8-82fd-c5b0b792a150', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'PepsiCo', 'pepsico');
insert into customers (id, organization_id, name, normalized_name) values ('3c90036f-e6b7-4b08-9469-521b82376fa4', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Delta', 'delta');
insert into customers (id, organization_id, name, normalized_name) values ('2654b2f8-f228-4740-bfc4-b837eb8e3329', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Chevron', 'chevron');
insert into customers (id, organization_id, name, normalized_name) values ('a2f73dc9-5fa6-4f03-9918-accacc969211', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'J.P. Morgan', 'j p morgan');
insert into customers (id, organization_id, name, normalized_name) values ('0f269284-d184-4a86-82f8-7d7e59e146f6', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Nestle', 'nestle');
insert into customers (id, organization_id, name, normalized_name) values ('d95220cc-a7bf-48ba-b612-f5f3270d0b92', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Target', 'target');
insert into customers (id, organization_id, name, normalized_name) values ('77a0625f-8135-41a7-a56f-627025f1ecd8', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'AT&T', 'at and t');
insert into customers (id, organization_id, name, normalized_name) values ('b516ce9b-d596-4fc3-a241-3c532f5e1472', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Sentinel One', 'sentinel one');
insert into customers (id, organization_id, name, normalized_name) values ('04632960-3e67-4689-b135-006af49c32e8', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ProofPoint', 'proofpoint');
insert into customers (id, organization_id, name, normalized_name) values ('4f1828fa-a1c5-496f-a8e0-974a2bd72c69', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Stellar Cyber', 'stellar cyber');
insert into customers (id, organization_id, name, normalized_name) values ('aa5be2ed-20e2-453e-88a0-fbcc96f9689f', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'CrowdStrike', 'crowdstrike');
insert into customers (id, organization_id, name, normalized_name) values ('8db12da1-b0c5-464b-9fab-fac2fa75d202', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Team Cymru', 'team cymru');
insert into customers (id, organization_id, name, normalized_name) values ('0fb0e11e-6c84-41c9-9d93-189fb21c47d4', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Trace3', 'trace3');
insert into customers (id, organization_id, name, normalized_name) values ('3465fde3-3861-46af-bf28-5b5813f41313', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ArmorBlox', 'armorblox');
insert into customers (id, organization_id, name, normalized_name) values ('9d9538fc-44db-4e1a-9197-cba4f4a7e488', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Keyfactor', 'keyfactor');
insert into customers (id, organization_id, name, normalized_name) values ('d4e30372-1455-4a63-8d66-725e61c393f5', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Silverfort', 'silverfort');
insert into customers (id, organization_id, name, normalized_name) values ('b70c9c45-9e5c-4479-8922-485fadf951a4', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'FORTIFYDATA', 'fortifydata');
insert into customers (id, organization_id, name, normalized_name) values ('94b12e6e-af6e-45d4-9661-6ccfea0c693a', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Continuity', 'continuity');
insert into customers (id, organization_id, name, normalized_name) values ('f60c71ad-f801-4c92-aaa8-998d8c3cad58', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'CITY Furniture', 'city furniture');
insert into customers (id, organization_id, name, normalized_name) values ('2077c248-d485-4871-aae9-bb7a34080c2c', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Sirona', 'sirona');
insert into customers (id, organization_id, name, normalized_name) values ('ebacb92a-e6ff-499d-832e-b580fe05558f', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Munters', 'munters');
insert into customers (id, organization_id, name, normalized_name) values ('ddb600c6-14be-44a1-a08b-570975d6d50f', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Evanta', 'evanta');
insert into customers (id, organization_id, name, normalized_name) values ('d88b05fe-b12c-4b3d-bbc2-cad2e0638215', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Teledyne', 'teledyne');
insert into customers (id, organization_id, name, normalized_name) values ('2fdaa275-9c2a-4e1a-8ba5-5ed88285ed1f', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'NSW', 'nsw');
insert into customers (id, organization_id, name, normalized_name) values ('6126e75a-5077-48c5-a02c-ad557db3a218', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Fujitsu', 'fujitsu');
insert into customers (id, organization_id, name, normalized_name) values ('bc1e40e0-34ee-47ee-905b-5b1c403f19db', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e2e Assure', 'e2e assure');
insert into customers (id, organization_id, name, normalized_name) values ('8c687d5b-a3c1-40b2-94ce-3480b605a267', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Dragos', 'dragos');
insert into customers (id, organization_id, name, normalized_name) values ('836c3929-5e1b-4fa7-b5f5-114bf7b59231', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'OpenAI', 'openai');
insert into customers (id, organization_id, name, normalized_name) values ('03c478d0-8e35-444a-adda-a62c11ddcc59', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'CISPA Heimholtz Center for Information Security', 'cispa heimholtz center for information security');
insert into customers (id, organization_id, name, normalized_name) values ('4605e17d-2d46-49b6-bb6f-1d3b178d36c3', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Armis', 'armis');
insert into customers (id, organization_id, name, normalized_name) values ('890c960a-10ad-49bd-a434-fcc2881843d1', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Axonius', 'axonius');
insert into customers (id, organization_id, name, normalized_name) values ('81ae413a-3ebd-411f-843b-3c9cad3facc1', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ManageEngine', 'manageengine');
insert into customers (id, organization_id, name, normalized_name) values ('1e765a86-a52a-40b8-a3fe-4f0c9240fa14', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Qualys', 'qualys');
insert into customers (id, organization_id, name, normalized_name) values ('4bb7c8e1-9305-47fb-934e-2494acff3bef', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Sophos', 'sophos');
insert into customers (id, organization_id, name, normalized_name) values ('0a1e10dd-bd69-4f7d-9ddb-34d281b3d9b6', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'SysDig', 'sysdig');
insert into customers (id, organization_id, name, normalized_name) values ('2f4c4a0f-4c2d-458d-b088-06d8dff9f636', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Trend', 'trend');
insert into customers (id, organization_id, name, normalized_name) values ('9a89702c-a0d3-4317-bf5a-1dc8cb00d276', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'CheckPoint', 'checkpoint');
insert into customers (id, organization_id, name, normalized_name) values ('3a304ef6-0ec0-41e3-9a5a-aa250d12c67c', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'DarkTrace', 'darktrace');
insert into customers (id, organization_id, name, normalized_name) values ('fbb1e49e-0cec-4c13-9aea-0c148caebca1', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Perception Point', 'perception point');
insert into customers (id, organization_id, name, normalized_name) values ('a95fba71-29a3-402c-b016-695cbeae26fa', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Rd Canary', 'rd canary');
insert into customers (id, organization_id, name, normalized_name) values ('9f0a58bf-038a-45dd-ac6e-49e11603c90a', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Malware Bytes', 'malware bytes');
insert into customers (id, organization_id, name, normalized_name) values ('0bdf3e19-885a-42c4-b1c3-778855dfc310', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Perimiter 81', 'perimiter 81');
insert into customers (id, organization_id, name, normalized_name) values ('cc3488c7-2d6a-43c8-abe8-43a537be7c93', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'SolCyber', 'solcyber');
insert into customers (id, organization_id, name, normalized_name) values ('a7078a8f-ad41-46bc-9930-183d652d09d1', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Elastic', 'elastic');
insert into customers (id, organization_id, name, normalized_name) values ('f1fbc76f-789a-40f0-b8f5-b9998075c5e9', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'SpecterOps', 'specterops');
insert into customers (id, organization_id, name, normalized_name) values ('e11948dd-cb9f-4a55-aa9b-fbcdb7b40a3d', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Battelle', 'battelle');
insert into customers (id, organization_id, name, normalized_name) values ('60c4cdd3-eabb-4919-878c-b4719276764c', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'TurnGate', 'turngate');
insert into customers (id, organization_id, name, normalized_name) values ('1c22e6ed-f19c-4020-844b-a5c4b87acf2a', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Marcum Technology', 'marcum technology');
insert into customers (id, organization_id, name, normalized_name) values ('9c860525-89c8-4723-983b-b54d1a7a75c0', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Fortinet Federal', 'fortinet federal');
insert into customers (id, organization_id, name, normalized_name) values ('eb41b08e-7b62-4025-8fd5-1a0231a611f4', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Threat Locker', 'threat locker');
insert into customers (id, organization_id, name, normalized_name) values ('81553af5-02df-4dbd-8e8d-e63821aadc3d', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Dark Trace', 'dark trace');
insert into customers (id, organization_id, name, normalized_name) values ('10e7832b-fd81-4856-8354-245ffcae0876', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Cylance', 'cylance');
insert into customers (id, organization_id, name, normalized_name) values ('3d666aba-7b3c-42f7-a773-1875916739ce', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Sonatype', 'sonatype');
insert into customers (id, organization_id, name, normalized_name) values ('c1a4a687-5cdd-4042-bda4-6d5e0eca3238', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Grimco', 'grimco');
insert into customers (id, organization_id, name, normalized_name) values ('a8e9869b-57a9-4820-b9c8-64f0671a6228', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'DataOrbis', 'dataorbis');
insert into customers (id, organization_id, name, normalized_name) values ('51fc8f67-bb50-4178-9f10-c0712c5d9038', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Deloitte', 'deloitte');
insert into customers (id, organization_id, name, normalized_name) values ('3fa5fd25-9ce3-4fe5-a71c-e6fa61994837', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Videndum', 'videndum');
insert into customers (id, organization_id, name, normalized_name) values ('4ca091ff-edc8-4902-a116-4af942aa7fe5', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Computacenter', 'computacenter');
insert into customers (id, organization_id, name, normalized_name) values ('131add08-1d1a-4bf2-99c2-ec4eda4bdc86', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Sony', 'sony');
insert into customers (id, organization_id, name, normalized_name) values ('c74b994d-23cd-42ee-ab6a-6fe3c854feac', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'CitiBank', 'citibank');
insert into customers (id, organization_id, name, normalized_name) values ('4120bfa7-50c2-4c9e-9ea6-e6120e2d1d8a', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Spotify', 'spotify');
insert into customers (id, organization_id, name, normalized_name) values ('a7db0688-8a6f-4cd8-b781-3d372c935e87', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'WPP', 'wpp');
insert into customers (id, organization_id, name, normalized_name) values ('fc690b09-d27f-4214-a589-535e3de25f2e', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '20ten', '20ten');
insert into customers (id, organization_id, name, normalized_name) values ('2b769950-7ad6-4a59-96df-48ed51d2209b', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'GroupM', 'groupm');
insert into customers (id, organization_id, name, normalized_name) values ('baac514d-4baf-485c-8334-c89d025f1153', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'NASA', 'nasa');
insert into customers (id, organization_id, name, normalized_name) values ('2b4380e0-ede1-4ff7-ba64-b7ffbb2328b6', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Lufthansa', 'lufthansa');
insert into customers (id, organization_id, name, normalized_name) values ('685d220a-8119-4e90-be24-3a7214658d4f', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'gopuff', 'gopuff');
insert into customers (id, organization_id, name, normalized_name) values ('cbb8da7e-1ce1-409e-86c9-a05e2283d9e7', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Purple', 'purple');
insert into customers (id, organization_id, name, normalized_name) values ('c24b1cfe-8e78-4f4b-a04c-7842b4543ca5', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'DataDog', 'datadog');
insert into customers (id, organization_id, name, normalized_name) values ('96c4a747-17c9-4f96-9e3d-268e5a67a8fc', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Databricks', 'databricks');
insert into customers (id, organization_id, name, normalized_name) values ('02fd8cc8-6330-485a-94cb-a400f1b79908', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Securiti', 'securiti');
insert into customers (id, organization_id, name, normalized_name) values ('baaae462-9017-4203-b2f2-6263f3d9065d', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Rockfish Data', 'rockfish data');
insert into customers (id, organization_id, name, normalized_name) values ('2de9b828-dc91-4566-bb17-f88760d36de8', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'TrueFort', 'truefort');
insert into customers (id, organization_id, name, normalized_name) values ('06703e5b-98ac-4983-a154-a2461c11e9dc', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Siemens', 'siemens');
insert into customers (id, organization_id, name, normalized_name) values ('d42a1479-642a-486d-9733-0f786de8ecdb', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'SecureWorks', 'secureworks');
insert into customers (id, organization_id, name, normalized_name) values ('b6d783e3-ca8b-4e8e-9a52-2ac57004d3a5', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '1Password', '1password');
insert into customers (id, organization_id, name, normalized_name) values ('cd7717fb-bb1a-4ab7-91ab-da2c61b80afc', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Abacode', 'abacode');
insert into customers (id, organization_id, name, normalized_name) values ('238b914d-1a09-4ab0-918b-31e675b8ba70', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Claroty', 'claroty');
insert into customers (id, organization_id, name, normalized_name) values ('3295ffd7-dcfb-49e5-9ca7-569cb9949a6a', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Pentera', 'pentera');
insert into customers (id, organization_id, name, normalized_name) values ('62556962-11c3-4d1a-ae2a-d4834a2ebde6', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Safebreach', 'safebreach');
insert into customers (id, organization_id, name, normalized_name) values ('5957787b-23ec-4985-8bb5-bd027c4f40f8', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Sonrai', 'sonrai');
insert into customers (id, organization_id, name, normalized_name) values ('093c4d02-d3f9-48ec-854c-dfa65ac49632', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'virsec', 'virsec');

-- Internal portfolio (the org's own offerings).
insert into internal_products (id, organization_id, name) values ('d9438672-9bdd-4aa1-8de8-ff590ef92e97', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Connect');
insert into internal_products (id, organization_id, name) values ('f067a804-b0d3-4bbe-8301-11dbb5f85bc5', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Communities');
insert into internal_products (id, organization_id, name) values ('3af266af-0c76-4297-8646-2a8a3e4c6d42', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Events');
insert into internal_products (id, organization_id, name) values ('ecbcb000-54e3-4a5f-9f10-0ca8acfa1a8d', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'CyberRisk TV');
insert into internal_products (id, organization_id, name) values ('7468516b-216f-43a3-9950-7f3dd8112de1', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'CyberCept');
insert into internal_products (id, organization_id, name) values ('ead6bd90-f29a-42c0-a704-52ea5175d4e0', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Founder Stories');
insert into internal_products (id, organization_id, name) values ('c658d81e-490d-40f3-b8fc-3df0dd8e5587', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Podcasts');
insert into internal_products (id, organization_id, name) values ('06e93402-4e6b-4837-88d7-18f97cd7bdf7', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Mythbusters');
insert into internal_products (id, organization_id, name) values ('b07777f9-e2ba-4814-a96b-fcf6ef02d1f2', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Webinars');
insert into internal_products (id, organization_id, name) values ('c8024d09-09de-474b-91ec-986562143d24', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Research');
insert into internal_products (id, organization_id, name) values ('e3ec49d7-1d59-4e74-bfff-44edfd1853b5', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Content');
insert into internal_products (id, organization_id, name) values ('89898124-dec2-44d0-aec2-4a0c9dcdb772', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ABM');

-- ActualTech
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('823df8a3-68d6-48aa-ac3c-c0c5c229f61d', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ActualTech', 'actualtech', 'https://www.actualtechmedia.com/', null, null, null, null, 60, 'pending_review', 'Connect!Row2', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '823df8a3-68d6-48aa-ac3c-c0c5c229f61d', 'positioning', 'strength', '{"kind":"strength","text":"Exclusive IT Webinar & Content Syndication. B2B Lead Generation Programs."}'::jsonb, 'Exclusive IT Webinar & Content Syndication. B2B Lead Generation Programs.', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('3c0dacc3-7c7c-46f2-8da7-4eba3ad407cf', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '823df8a3-68d6-48aa-ac3c-c0c5c229f61d', 'www.actualtechmedia.com/b2b-lead-generation', 'www actualtechmedia com b2b lead generation', 'https://www.actualtechmedia.com/b2b-lead-generation/', 60, 'pending_review', 'Connect!Row2', now());
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('02e10938-85cc-4bfc-8d21-428be9b9c26c', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '823df8a3-68d6-48aa-ac3c-c0c5c229f61d', 'www.actualtechmedia.com/tech-webinars', 'www actualtechmedia com tech webinars', 'https://www.actualtechmedia.com/tech-webinars/', 60, 'pending_review', 'Connect!Row2', now());
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('016f5704-ec52-43d3-9580-8d9cde5e53d2', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '823df8a3-68d6-48aa-ac3c-c0c5c229f61d', 'www.actualtechmedia.com/custom-webinars', 'www actualtechmedia com custom webinars', 'https://www.actualtechmedia.com/custom-webinars/', 60, 'pending_review', 'Connect!Row2', now());
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('e4619aa1-5ae4-4ebc-869c-120cfdde463e', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '823df8a3-68d6-48aa-ac3c-c0c5c229f61d', 'www.actualtechmedia.com/content-syndication', 'www actualtechmedia com content syndication', 'https://www.actualtechmedia.com/content-syndication/', 60, 'pending_review', 'Connect!Row2', now());
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('35acf944-b251-4eba-a8f5-b70cf43d437d', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '823df8a3-68d6-48aa-ac3c-c0c5c229f61d', 'www.actualtechmedia.com/tech-buyers-roundtable', 'www actualtechmedia com tech buyers roundtable', 'https://www.actualtechmedia.com/tech-buyers-roundtable/', 60, 'pending_review', 'Connect!Row2', now());
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('4b7854bc-3d7f-401c-b011-e34c0e6d3288', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '823df8a3-68d6-48aa-ac3c-c0c5c229f61d', 'www.actualtechmedia.com/content', 'www actualtechmedia com content', 'https://www.actualtechmedia.com/content/', 60, 'pending_review', 'Connect!Row2', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '823df8a3-68d6-48aa-ac3c-c0c5c229f61d', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '823df8a3-68d6-48aa-ac3c-c0c5c229f61d', 'e3ec49d7-1d59-4e74-bfff-44edfd1853b5', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '823df8a3-68d6-48aa-ac3c-c0c5c229f61d', 'c8024d09-09de-474b-91ec-986562143d24', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '823df8a3-68d6-48aa-ac3c-c0c5c229f61d', 'b07777f9-e2ba-4814-a96b-fcf6ef02d1f2', 'adjacent', 60, null, now(), true);

-- VIB
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('18cbdb5b-95bc-4d49-94fd-206a0dc477ec', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'VIB', 'vib', 'https://vib.tech/', null, null, null, null, 60, 'pending_review', 'Connect!Row3', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '18cbdb5b-95bc-4d49-94fd-206a0dc477ec', 'positioning', 'strength', '{"kind":"strength","text":"\"our buying community of 10M+ IT professionals. Our team identifies your ideal customers, gives you a lead guarantee, and delivers on it with opt-ins from our network that IT members join to actively seek solutions.\r\nLead guarantees so you have clear ROI\r\nAvg conversion rate of 50% from meeting to opportunity\r\nNo third-party data or outsourced call centers - real buyers looking for providers\r\nFull-funnel solutions including appointments, content syndication, full-service webinars, etc.\""}'::jsonb, '"our buying community of 10M+ IT professionals. Our team identifies your ideal customers, gives you a lead guarantee, and delivers on it with opt-ins from our network that IT members join to actively seek solutions.
Lead guarantees so you have clear ROI
Avg conversion rate of 50% from meeting to opportunity
No third-party data or outsourced call centers - real buyers looking for providers
Full-funnel solutions including appointments, content syndication, full-service webinars, etc."', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('944b016a-98e6-439b-84dd-3cd745b678f5', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '18cbdb5b-95bc-4d49-94fd-206a0dc477ec', 'vib.tech/solutions', 'vib tech solutions', 'https://vib.tech/solutions/emails/', 60, 'pending_review', 'Connect!Row3', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '944b016a-98e6-439b-84dd-3cd745b678f5', 35, 17500, 'USD', 'ViB Emails Starting at $2,200 per send To 75,000 community members that match your criteria
ViB Appointments Starting at $900 per meeting Price per meeting varies based on targeting specifications provided
ViB Syndication Starting at $35 per lead Price per lead variable on targeting specifications provided
ViB Webinars Starting at/
$15,000 per webinar For a live webinar with a 100 attendee guarantee
ViB Research Starting at $17,500 per survey For a sample size of 200-300 respondents
ViB Deal Discovery Starting at $450 per lead Price variable on targeting specifications provided', 60, now());
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('c5507e6b-d2fe-4641-b76b-4ab4d56203b4', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '18cbdb5b-95bc-4d49-94fd-206a0dc477ec', 'vib.tech/solutions', 'vib tech solutions', 'https://vib.tech/solutions/appointments/', 60, 'pending_review', 'Connect!Row3', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'c5507e6b-d2fe-4641-b76b-4ab4d56203b4', 35, 17500, 'USD', 'ViB Emails Starting at $2,200 per send To 75,000 community members that match your criteria
ViB Appointments Starting at $900 per meeting Price per meeting varies based on targeting specifications provided
ViB Syndication Starting at $35 per lead Price per lead variable on targeting specifications provided
ViB Webinars Starting at/
$15,000 per webinar For a live webinar with a 100 attendee guarantee
ViB Research Starting at $17,500 per survey For a sample size of 200-300 respondents
ViB Deal Discovery Starting at $450 per lead Price variable on targeting specifications provided', 60, now());
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('871f1e04-8535-4450-bd90-6fdd219db1c7', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '18cbdb5b-95bc-4d49-94fd-206a0dc477ec', 'vib.tech/solutions', 'vib tech solutions', 'https://vib.tech/solutions/syndication/', 60, 'pending_review', 'Connect!Row3', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '871f1e04-8535-4450-bd90-6fdd219db1c7', 35, 17500, 'USD', 'ViB Emails Starting at $2,200 per send To 75,000 community members that match your criteria
ViB Appointments Starting at $900 per meeting Price per meeting varies based on targeting specifications provided
ViB Syndication Starting at $35 per lead Price per lead variable on targeting specifications provided
ViB Webinars Starting at/
$15,000 per webinar For a live webinar with a 100 attendee guarantee
ViB Research Starting at $17,500 per survey For a sample size of 200-300 respondents
ViB Deal Discovery Starting at $450 per lead Price variable on targeting specifications provided', 60, now());
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('ac3e5984-f24a-4ff1-a7b6-5f98f867f45e', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '18cbdb5b-95bc-4d49-94fd-206a0dc477ec', 'vib.tech/solutions', 'vib tech solutions', 'https://vib.tech/solutions/webinars/', 60, 'pending_review', 'Connect!Row3', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ac3e5984-f24a-4ff1-a7b6-5f98f867f45e', 35, 17500, 'USD', 'ViB Emails Starting at $2,200 per send To 75,000 community members that match your criteria
ViB Appointments Starting at $900 per meeting Price per meeting varies based on targeting specifications provided
ViB Syndication Starting at $35 per lead Price per lead variable on targeting specifications provided
ViB Webinars Starting at/
$15,000 per webinar For a live webinar with a 100 attendee guarantee
ViB Research Starting at $17,500 per survey For a sample size of 200-300 respondents
ViB Deal Discovery Starting at $450 per lead Price variable on targeting specifications provided', 60, now());
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('59490dfb-22c5-41f0-99d3-6b1d4b790c58', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '18cbdb5b-95bc-4d49-94fd-206a0dc477ec', 'vib.tech/solutions', 'vib tech solutions', 'https://vib.tech/solutions/research/', 60, 'pending_review', 'Connect!Row3', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '59490dfb-22c5-41f0-99d3-6b1d4b790c58', 35, 17500, 'USD', 'ViB Emails Starting at $2,200 per send To 75,000 community members that match your criteria
ViB Appointments Starting at $900 per meeting Price per meeting varies based on targeting specifications provided
ViB Syndication Starting at $35 per lead Price per lead variable on targeting specifications provided
ViB Webinars Starting at/
$15,000 per webinar For a live webinar with a 100 attendee guarantee
ViB Research Starting at $17,500 per survey For a sample size of 200-300 respondents
ViB Deal Discovery Starting at $450 per lead Price variable on targeting specifications provided', 60, now());
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('2bdbb71a-80b5-4dd4-b69b-2760d8cac175', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '18cbdb5b-95bc-4d49-94fd-206a0dc477ec', 'vib.tech/solutions', 'vib tech solutions', 'https://vib.tech/solutions/deal-intent/', 60, 'pending_review', 'Connect!Row3', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '2bdbb71a-80b5-4dd4-b69b-2760d8cac175', 35, 17500, 'USD', 'ViB Emails Starting at $2,200 per send To 75,000 community members that match your criteria
ViB Appointments Starting at $900 per meeting Price per meeting varies based on targeting specifications provided
ViB Syndication Starting at $35 per lead Price per lead variable on targeting specifications provided
ViB Webinars Starting at/
$15,000 per webinar For a live webinar with a 100 attendee guarantee
ViB Research Starting at $17,500 per survey For a sample size of 200-300 respondents
ViB Deal Discovery Starting at $450 per lead Price variable on targeting specifications provided', 60, now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '18cbdb5b-95bc-4d49-94fd-206a0dc477ec', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, null, now(), true);

-- HelpNet Security
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('6af2509d-8259-4d9b-89a9-be7553fb5bd8', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'HelpNet Security', 'helpnet security', 'https://www.helpnetsecurity.com/', null, null, null, null, 60, 'pending_review', 'Connect!Row4; Podcasts!Row2', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '6af2509d-8259-4d9b-89a9-be7553fb5bd8', 'positioning', 'strength', '{"kind":"strength","text":"News aggreggation and distribution\r\nWe specialize in integrated packages, through which we provide a custom\r– fitted campaign for every client, based on factors such as the scope of the\rcampaign (branding, lead generation or a combination of both), budget /\rbudget range, and the timeframe. These packages can contain up to 15\rdifferent placements throughout the Help Net Security website."}'::jsonb, 'News aggreggation and distribution
We specialize in integrated packages, through which we provide a custom– fitted campaign for every client, based on factors such as the scope of thecampaign (branding, lead generation or a combination of both), budget /budget range, and the timeframe. These packages can contain up to 15different placements throughout the Help Net Security website.', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '6af2509d-8259-4d9b-89a9-be7553fb5bd8', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '6af2509d-8259-4d9b-89a9-be7553fb5bd8', 'e3ec49d7-1d59-4e74-bfff-44edfd1853b5', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '6af2509d-8259-4d9b-89a9-be7553fb5bd8', '89898124-dec2-44d0-aec2-4a0c9dcdb772', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '6af2509d-8259-4d9b-89a9-be7553fb5bd8', 'c658d81e-490d-40f3-b8fc-3df0dd8e5587', 'adjacent', 60, null, now(), true);

-- Content Workshop
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('b147d541-9cae-44fc-908b-8c6caf381927', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Content Workshop', 'content workshop', 'https://contentworkshop.com/', null, null, null, null, 60, 'pending_review', 'Connect!Row5', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b147d541-9cae-44fc-908b-8c6caf381927', 'positioning', 'strength', '{"kind":"strength","text":"a story-first agency that creates brand identities, content, and websites that convert views into revenue.\r\nYour problems are our problems. Your goals are our goals. We’re agile and opinionated. We can bend with you but won’t be shy to tell you when we think there’s a better way."}'::jsonb, 'a story-first agency that creates brand identities, content, and websites that convert views into revenue.
Your problems are our problems. Your goals are our goals. We’re agile and opinionated. We can bend with you but won’t be shy to tell you when we think there’s a better way.', 60, 'import', 'pending');
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b147d541-9cae-44fc-908b-8c6caf381927', 'positioning', 'weakness', '{"kind":"weakness","text":"solely focused on brand story and content"}'::jsonb, 'solely focused on brand story and content', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('64fb58d5-78fc-45f2-be36-36c88b3cb92d', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b147d541-9cae-44fc-908b-8c6caf381927', 'contentworkshop.com/solutions', 'contentworkshop com solutions', 'https://contentworkshop.com/solutions/', 60, 'pending_review', 'Connect!Row5', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b147d541-9cae-44fc-908b-8c6caf381927', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b147d541-9cae-44fc-908b-8c6caf381927', 'e3ec49d7-1d59-4e74-bfff-44edfd1853b5', 'adjacent', 60, null, now(), true);
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b147d541-9cae-44fc-908b-8c6caf381927', 'a9c839ad-fc0f-45f6-9c4c-0af375252c63', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b147d541-9cae-44fc-908b-8c6caf381927', '949aca03-774b-4648-80b6-b54bf02bbc09', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b147d541-9cae-44fc-908b-8c6caf381927', '09657cfd-30ea-424b-b8f8-c737184a2365', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b147d541-9cae-44fc-908b-8c6caf381927', '97bca7d5-9bd4-401a-a195-9fc4d1531fc7', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b147d541-9cae-44fc-908b-8c6caf381927', '858cb566-98f1-4d9d-b93b-fd1b7b31f77f', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b147d541-9cae-44fc-908b-8c6caf381927', 'a7cdd01a-d3dd-45f6-a099-3562c770596f', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b147d541-9cae-44fc-908b-8c6caf381927', '47285db9-9dbf-4259-bc69-95315d9f4964', 'unknown', 60, now());

-- Cyberedge Group
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('77a2f200-814f-4ee2-ba59-ba6190698df1', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Cyberedge Group', 'cyberedge', 'https://cyber-edge.com/', null, null, null, null, 60, 'pending_review', 'Connect!Row6', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '77a2f200-814f-4ee2-ba59-ba6190698df1', 'positioning', 'strength', '{"kind":"strength","text":"Marketing and Research for Cybersecurity Vendors"}'::jsonb, 'Marketing and Research for Cybersecurity Vendors', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('0e5e31c7-255c-4986-85d4-10fa4cdcb25e', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '77a2f200-814f-4ee2-ba59-ba6190698df1', 'cyber-edge.com/services', 'cyber edge com services', 'https://cyber-edge.com/services/', 60, 'pending_review', 'Connect!Row6', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '77a2f200-814f-4ee2-ba59-ba6190698df1', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '77a2f200-814f-4ee2-ba59-ba6190698df1', 'e3ec49d7-1d59-4e74-bfff-44edfd1853b5', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '77a2f200-814f-4ee2-ba59-ba6190698df1', '89898124-dec2-44d0-aec2-4a0c9dcdb772', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '77a2f200-814f-4ee2-ba59-ba6190698df1', 'c8024d09-09de-474b-91ec-986562143d24', 'adjacent', 60, null, now(), true);
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '77a2f200-814f-4ee2-ba59-ba6190698df1', 'f9956869-c416-49a5-8d48-0d91a14ee07d', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '77a2f200-814f-4ee2-ba59-ba6190698df1', '1d820768-9d09-44ba-bafc-83b9d82d5c17', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '77a2f200-814f-4ee2-ba59-ba6190698df1', '59435453-fbf3-4359-9c20-431f10d56320', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '77a2f200-814f-4ee2-ba59-ba6190698df1', '813a1ecb-4ff2-4900-9e4d-58a7bad82f1f', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '77a2f200-814f-4ee2-ba59-ba6190698df1', '54e3b749-3097-4945-a3c4-7e1359d484b1', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '77a2f200-814f-4ee2-ba59-ba6190698df1', '2a174ebd-72da-45d7-aa61-620133a9db64', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '77a2f200-814f-4ee2-ba59-ba6190698df1', '0acf73c1-8b03-4953-a79c-d52db33cf2ff', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '77a2f200-814f-4ee2-ba59-ba6190698df1', '4821a260-513d-4865-baae-faf76b7431a5', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '77a2f200-814f-4ee2-ba59-ba6190698df1', '80528204-0dba-4c59-a688-d94efa69eb70', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '77a2f200-814f-4ee2-ba59-ba6190698df1', '33c80466-f9a9-4f6c-b5f7-8b4052178728', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '77a2f200-814f-4ee2-ba59-ba6190698df1', '8a575d0a-a584-45a8-a92c-b1329d89c832', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '77a2f200-814f-4ee2-ba59-ba6190698df1', '67e5f47e-cf24-4258-873b-7692ab683b0c', 'unknown', 60, now());

-- Navattic
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('2acd3197-6336-4402-96be-4597c8321ea4', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Navattic', 'navattic', 'https://www.navattic.com/', null, null, null, null, 60, 'pending_review', 'Connect!Row7', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '2acd3197-6336-4402-96be-4597c8321ea4', 'positioning', 'strength', '{"kind":"strength","text":"Hands-on product access. Embed on your website, share in the sales cycle, and send in email campaigns."}'::jsonb, 'Hands-on product access. Embed on your website, share in the sales cycle, and send in email campaigns.', 60, 'import', 'pending');
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '2acd3197-6336-4402-96be-4597c8321ea4', 'positioning', 'weakness', '{"kind":"weakness","text":"Focused on product demo offering"}'::jsonb, 'Focused on product demo offering', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('ffb679db-8032-48df-ad08-ff2a765e33c0', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '2acd3197-6336-4402-96be-4597c8321ea4', 'www.navattic.com/product-demos', 'www navattic com product demos', 'https://www.navattic.com/product-demos', 60, 'pending_review', 'Connect!Row7', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ffb679db-8032-48df-ad08-ff2a765e33c0', 500, 1000, 'USD', 'Base - $500/month Annually
∞Unlimited licenses
∞Unlimited interactive demos
∞Unlimited demo views
∞Unlimited integrations

Growth - $1,000/month Annually
Multi-team functionality
SSO and Directory Sync
Multi-language support
Dedicated CSM
Demo coaching', 60, now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '2acd3197-6336-4402-96be-4597c8321ea4', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '2acd3197-6336-4402-96be-4597c8321ea4', '89898124-dec2-44d0-aec2-4a0c9dcdb772', 'adjacent', 60, null, now(), true);
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '2acd3197-6336-4402-96be-4597c8321ea4', 'cf84ea12-a432-49e2-9b3d-bc2274390a7f', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '2acd3197-6336-4402-96be-4597c8321ea4', '31d2169c-e0a9-47dc-961e-5de83dc4dfc5', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '2acd3197-6336-4402-96be-4597c8321ea4', '2e795138-8d32-43fd-94a5-1c7d2f0214f0', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '2acd3197-6336-4402-96be-4597c8321ea4', 'a324a2e5-4dff-41da-965b-8ebd9c7f1293', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '2acd3197-6336-4402-96be-4597c8321ea4', 'cc6d0964-688a-497e-9f49-245e21e58ceb', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '2acd3197-6336-4402-96be-4597c8321ea4', '3eae4626-2160-4cdb-b87a-0e1175c75b7b', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '2acd3197-6336-4402-96be-4597c8321ea4', 'c7f96765-794d-4d20-8e44-e457d219846f', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '2acd3197-6336-4402-96be-4597c8321ea4', '1c0a5d73-f765-472c-bb3d-c04a82a7cebc', 'unknown', 60, now());

-- Techstrong Group
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('4727e539-5c87-47a9-865e-c076fe3df683', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Techstrong Group', 'techstrong', 'https://techstronggroup.com/', null, null, null, null, 60, 'pending_review', 'Connect!Row8; Podcasts!Row3', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4727e539-5c87-47a9-865e-c076fe3df683', 'positioning', 'strength', '{"kind":"strength","text":"Techstrong Group is an omniversal media company covering IT industries and practices that are re-shaping the world of technology. Specifically, DevOps, cloud-native, cybersecurity and digital transformation are the communities we live in.\r\n\r\nWe deliver high-quality content to a global community of IT professionals and high-value leads to tech vendors. We help you share your story, expand your audience and grow your business."}'::jsonb, 'Techstrong Group is an omniversal media company covering IT industries and practices that are re-shaping the world of technology. Specifically, DevOps, cloud-native, cybersecurity and digital transformation are the communities we live in.

We deliver high-quality content to a global community of IT professionals and high-value leads to tech vendors. We help you share your story, expand your audience and grow your business.', 60, 'import', 'pending');
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4727e539-5c87-47a9-865e-c076fe3df683', 'positioning', 'weakness', '{"kind":"weakness","text":"Focused on content for IT industry"}'::jsonb, 'Focused on content for IT industry', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('633d4c4f-b25d-4feb-8a66-4beb749de37c', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4727e539-5c87-47a9-865e-c076fe3df683', 'techstronggroup.com/services', 'techstronggroup com services', 'https://techstronggroup.com/services/', 60, 'pending_review', 'Connect!Row8', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '633d4c4f-b25d-4feb-8a66-4beb749de37c', 5000, 40000, 'USD', 'TSTV Interview
(2 interviews)
$5,000
Description: 1:1 interview conducted by a Techstrong Group employee - C-level
Deliverable: The interview airs on Techstrong.tv and interview ispromoted on the appropriate website (Securityboulevard.com, DevOps.com, digitalcxo.com, Techstrong.ai)

Webinar 
$15,000.00 
$12,500.00 w discount
1. The webinar will have the ability to have live text chat, pollingquestions and will be provided a moderator if desired.
2. Techstrong will promote the webinar to our database, socialmedia, Google Ads, etc.
3. Techstrong will promote the webinar to ensure the minimum 200registration guarantee is realized. Techstrong averages 300registrations.
4. Techstrong will create & host the virtual environment as peragreed-upon requirements.
5. Techstrong will work with client on design and layout to ensureclient''s branding is consistent, and guidelines are followed.
6. Techstrong will provide an Mp4 file of the webinar to post on theirwebsite and YouTube, if they so desire.
7. Techstrong will provide live support during the webinar.
8. After the webinar is completed, Techstrong will provide and post,on its appropriate Internet property, an on-demand version of thewebinar. The on-demand version will require registration, and clientwill have access to a live spreadsheet to access new registrations attheir convenience.
9. Techstrong will provide a landing page and registration form forthe landing page. Client will work with Techstrong to limit revisions.
10. Techstrong will share with client all registration data collected,which may include the following fields: First name, Last name,Email, Company, Job Title, Country, Zip Code, State or Province,Work Phone (optional at registration). Techstrong will provide toclient what is provided to Techstrong.
11. Techstrong will provide reports on which registrants attended theevent and if they asked any questions during the event.
12. Techstrong will work with client as it relates to content usagebeyond client properties. Approval is required by Techstrong.
13. Client maintains approval over any content used for promotion(email, social media, etc.) that utilizes the client brand or reference.
Client will provide:
1. Client will provide at least 1 speaker and “turn around” contentand any other approvals or due dates in order not to jeopardizepromotion, registration or the event execution date.
2. Techstrong desires all content (including PDF, graphics, etc.) to becompleted and delivered to Techstrong 6 weeks before the webinardate to ensure flawless execution of the webinar.

RSAC Sponsorship 
$40,000.00 
$30,000.00 w discount
• Both Live (May 6) and Virtual (June 18) Events
• Table inside DevOps Connect event room
• Featured in conference program
• Inclusion in mainstage rotating slidedeck during breaks
• Invitation to ‘Meet the Speakers’ during pre-conference, hosteddinner
• 15 minute live-streamed and recorded interview in RSAC Broadcast Alley
• Live ‘Meet-and-Greet’ information booth at AI Virtual Summit
• 15 minute session in the “Spotlight Track” at AI Virtual Summit
• 3 minute promo recording before a session at AI Virtual Summit
• Guarantee of 500 leads

Custom Podcast Series 
(5 podcasts)
$5,000.00 x 5 = $25,000
$12,500.00 after $12,500.00 discount
Series of podcast interviews that address a common theme. Basedon number of podcasts. Can be individual or group discussions.

Event Sponsorship (Spotlight) 
$15,000.00 x 2
$20,000.00 after $12,500.00 discount
Spotlight level sponsorship of one of the TS Live! Flagship events
Display any materials you choose in the virtual booth and provide a15-min speaking session or advertisement of your product or service
Deliverable (Lead Gen): Brand exposure, Exhibit booth, 300 Lead guarantee', 60, now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4727e539-5c87-47a9-865e-c076fe3df683', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4727e539-5c87-47a9-865e-c076fe3df683', 'b07777f9-e2ba-4814-a96b-fcf6ef02d1f2', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4727e539-5c87-47a9-865e-c076fe3df683', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4727e539-5c87-47a9-865e-c076fe3df683', 'e3ec49d7-1d59-4e74-bfff-44edfd1853b5', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4727e539-5c87-47a9-865e-c076fe3df683', 'ead6bd90-f29a-42c0-a704-52ea5175d4e0', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4727e539-5c87-47a9-865e-c076fe3df683', 'c658d81e-490d-40f3-b8fc-3df0dd8e5587', 'adjacent', 60, null, now(), true);
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4727e539-5c87-47a9-865e-c076fe3df683', 'd16441aa-accc-4244-8a8c-89c730be2fe9', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4727e539-5c87-47a9-865e-c076fe3df683', '8d8f24e9-44b9-4610-8133-35273e9e53b4', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4727e539-5c87-47a9-865e-c076fe3df683', '746de778-bbb8-4d95-8e1f-48f7df4cc191', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4727e539-5c87-47a9-865e-c076fe3df683', '650fa531-9cd5-4837-a3c1-237c183be018', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4727e539-5c87-47a9-865e-c076fe3df683', '26178b2a-c8e9-4f11-8286-9aea9346a7ea', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4727e539-5c87-47a9-865e-c076fe3df683', '3c7d1d98-2e10-4a82-b872-9d80438ede76', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4727e539-5c87-47a9-865e-c076fe3df683', 'f9956869-c416-49a5-8d48-0d91a14ee07d', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4727e539-5c87-47a9-865e-c076fe3df683', 'ed04e3b5-ea79-41db-93b7-0db3c2e7fb52', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4727e539-5c87-47a9-865e-c076fe3df683', '5201cab1-37c2-4417-bfee-47771c03b9d8', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4727e539-5c87-47a9-865e-c076fe3df683', '62f480fc-75fd-4acf-9244-87586a31ccb7', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4727e539-5c87-47a9-865e-c076fe3df683', '0a22b468-825d-4a17-ac0f-b980d973eda7', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4727e539-5c87-47a9-865e-c076fe3df683', '417e5cc4-269b-46ee-aebb-25501f410dc2', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4727e539-5c87-47a9-865e-c076fe3df683', '31c59e6f-123b-4d2d-b313-7de9d0f12301', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4727e539-5c87-47a9-865e-c076fe3df683', 'cf84ea12-a432-49e2-9b3d-bc2274390a7f', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4727e539-5c87-47a9-865e-c076fe3df683', '0ad6ea93-e1cc-44ed-bf9e-7b388769d8cf', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4727e539-5c87-47a9-865e-c076fe3df683', 'b39186d0-88ca-4682-ae00-88d8c87eb3d9', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4727e539-5c87-47a9-865e-c076fe3df683', '58116972-f1ba-4760-9d93-3b588c1d21cc', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4727e539-5c87-47a9-865e-c076fe3df683', '90b7d717-b4b3-40eb-8fb1-2e8589f88e57', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4727e539-5c87-47a9-865e-c076fe3df683', 'e3287b9b-3a65-4abd-a99e-79aa06565af7', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4727e539-5c87-47a9-865e-c076fe3df683', '7bb656ba-6f6f-4bb2-bebc-d99d9e72f98c', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4727e539-5c87-47a9-865e-c076fe3df683', '88840583-7d89-4030-976e-707f7b18fb09', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4727e539-5c87-47a9-865e-c076fe3df683', 'd86fb73c-7915-4b07-898c-77dcbe2d1013', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4727e539-5c87-47a9-865e-c076fe3df683', '9e3b5e7e-3ff7-42c4-b491-088342a35abd', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4727e539-5c87-47a9-865e-c076fe3df683', '43fea395-fcec-495b-9780-4dbbe1fef7eb', 'unknown', 60, now());

-- Beacon Digital
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('b7bc082a-f443-42fb-8b4f-4bc3b3c3b603', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Beacon Digital', 'beacon digital', 'https://www.beacondigitalmarketing.com/', null, null, null, null, 60, 'pending_review', 'Connect!Row9', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b7bc082a-f443-42fb-8b4f-4bc3b3c3b603', 'positioning', 'strength', '{"kind":"strength","text":"Integrated strategic approach, weaving together cutting-edge designers, dynamic content producers, expert marketing ops, and data-obsessed performance leaders. The result? Measurable impact and unstoppable growth."}'::jsonb, 'Integrated strategic approach, weaving together cutting-edge designers, dynamic content producers, expert marketing ops, and data-obsessed performance leaders. The result? Measurable impact and unstoppable growth.', 60, 'import', 'pending');
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b7bc082a-f443-42fb-8b4f-4bc3b3c3b603', 'positioning', 'weakness', '{"kind":"weakness","text":"C-P Systems, Corellium, Xeneta, Cents, FlashPoint, Cysiv, BioCatch, Signals Analytics"}'::jsonb, 'C-P Systems, Corellium, Xeneta, Cents, FlashPoint, Cysiv, BioCatch, Signals Analytics', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('2bf2ad3b-e477-432f-b03b-612eec787278', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b7bc082a-f443-42fb-8b4f-4bc3b3c3b603', 'www.beacondigitalmarketing.com/services', 'www beacondigitalmarketing com services', 'https://www.beacondigitalmarketing.com/services', 60, 'pending_review', 'Connect!Row9', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '2bf2ad3b-e477-432f-b03b-612eec787278', 8500, 100000, 'USD', 'Starter - $8,500+
TYPICAL AD BUDGET - $10,000/mo+

Great for companies looking to generate website traffic, and gain visibility in the market. Ads focus on prospecting audiences.

STRATEGY BUILD & CAMPAIGN LAUNCH
Overview of your organization and joint identification of goals
Focused strategy sessions with our service teams
Present the fruits of our labor and align on a path forward
Produce campaign assets and launch them into the world
EXAMPLE ONGOING SERVICES
1 Pillar Blog Post Per Quarter
2 Supporting Blog Posts per Month
1 Premium Content Offer per Quarter
1 Email Newsletter per Month
Organic Social Media Management for Facebook, Linkedin and Twitter
1 Landing Page per Quarter (Copy)
Paid Media Management for Linkedin
OPTIMIZE & BEYOND
Designated Account Team
Recurring meetings with your Account Strategist
Monthly Reporting with Data Studio + Supermetrics
Quarterly Strategy and Scope review

Growth - $20,000+
TYPICAL AD BUDGET - $10,000-$60,000/mo
Great for companies looking to turn visitors into qualified leads for sales teams and fuel their full marketing funnel with account-based marketing & inbound.

STRATEGY BUILD & CAMPAIGN LAUNCH
Overview of your organization and joint identification of goals
Focused strategy sessions with our service teams
Present the fruits of our labor and align on a path forward
Produce campaign assets and launch them into the world
EXAMPLE ONGOING SERVICES
1 Pillar Blog Post Per Quarter
2 Supporting Blog Posts per Month
2 Email Campaigns per Month (Newsletter + Offer)
2 Landing Pages per Quarter (Copy)
2 Premium Content Offers per Quarter (eg Ebooks or Infographics)
Basic Organic Social Media Management for Facebook, Linkedin and Twitter
Paid Media Management for Linkedin, Facebook Prospecting Campaigns*
Paid Search and Display Management on Google (incl. Remarketing)*
Programmatic Ad Management via StackAdapt*
OPTIMIZE & BEYOND
Designated Account Team
Weekly meetings with your Account Strategist
Monthly Reporting with Data Studio + Supermetrics
Quarterly Strategy and Scope review


Enterprise - $40,000+
TYPICAL AD BUDGET - $10,000-$100,000/mo+
Perfect for companies that are looking to ramp up marketing efforts at all stages from awareness to decision, including PR, ABM, marketing technology, web design and direct mail.

STRATEGY BUILD & CAMPAIGN LAUNCH
Overview of your organization and joint identification of goals
Focused strategy sessions with our service teams
Present the fruits of our labor and align on a path forward
Produce campaign assets and launch them into the world
EXAMPLE ONGOING SERVICES
1 Pillar Blog Post Per Quarter
1 Thought-Leadership Blog Post per Month
3 Supporting Blog Posts per Month
3 Email Campaigns per Month (Newsletter + Offer)
3 Landing Pages per Quarter (Copy)
2 Premium Content Offers per Quarter (eg Ebooks or Infographics)
Basic Organic Social Media Management for Facebook, Linkedin and Twitter
Paid Media Management for Linkedin, Facebook Prospecting Campaigns*
Paid Search and Display Management on Google (incl. Remarketing)*
Programmatic Ad Management via RollWorks*
Marketing Operations Support
Website Design & Development Support
OPTIMIZE & BEYOND
Designated Account Team
Weekly meetings with your Account Strategist
Monthly Reporting with Data Studio + Supermetrics
Quarterly Strategy and Scope review, Annual Strategy Review and Report', 60, now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b7bc082a-f443-42fb-8b4f-4bc3b3c3b603', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b7bc082a-f443-42fb-8b4f-4bc3b3c3b603', '89898124-dec2-44d0-aec2-4a0c9dcdb772', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b7bc082a-f443-42fb-8b4f-4bc3b3c3b603', 'e3ec49d7-1d59-4e74-bfff-44edfd1853b5', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b7bc082a-f443-42fb-8b4f-4bc3b3c3b603', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Kesscomm Cyber PR
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('3c25b918-7bf4-4fec-81f8-8161df96ba0c', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Kesscomm Cyber PR', 'kesscomm cyber pr', 'https://kesscomm.com/', null, null, null, null, 60, 'pending_review', 'Connect!Row10', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '3c25b918-7bf4-4fec-81f8-8161df96ba0c', 'positioning', 'strength', '{"kind":"strength","text":"KessComm Cyber PR is an independent results-driven Communications agency exclusively focused on early-stage to exit cybersecurity companies. With a 20+ year record of partnering with innovative cyber entrepreneurs and working alongside top CMOs, CISOs, venture capital and research firms, and other insiders in the cybersecurity community, KCPR’s unrivaled domain expertise, relationships and commitment to driving value through strategic story-building has made us a trusted source for our extensive media, analyst, and influencer networks."}'::jsonb, 'KessComm Cyber PR is an independent results-driven Communications agency exclusively focused on early-stage to exit cybersecurity companies. With a 20+ year record of partnering with innovative cyber entrepreneurs and working alongside top CMOs, CISOs, venture capital and research firms, and other insiders in the cybersecurity community, KCPR’s unrivaled domain expertise, relationships and commitment to driving value through strategic story-building has made us a trusted source for our extensive media, analyst, and influencer networks.', 60, 'import', 'pending');
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '3c25b918-7bf4-4fec-81f8-8161df96ba0c', 'positioning', 'weakness', '{"kind":"weakness","text":"Allegis Cyber, Armorblox, CipherTrace, Cloud Range, Contra Force, Cyversity, Devo, DF Labs, Domain Tools, Dragos, Feedly, Foretrace, HiTrust, ISSA, MimeCast, NanoLock, OccamSec, Onapsis, Pixm, Refirm Labs, ReliaQuest, SafeBreach, Sixmap, SkyBox Security, Team Cymru, Vicarius"}'::jsonb, 'Allegis Cyber, Armorblox, CipherTrace, Cloud Range, Contra Force, Cyversity, Devo, DF Labs, Domain Tools, Dragos, Feedly, Foretrace, HiTrust, ISSA, MimeCast, NanoLock, OccamSec, Onapsis, Pixm, Refirm Labs, ReliaQuest, SafeBreach, Sixmap, SkyBox Security, Team Cymru, Vicarius', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '3c25b918-7bf4-4fec-81f8-8161df96ba0c', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, 'Unmapped source tokens: LaunchTech', now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '3c25b918-7bf4-4fec-81f8-8161df96ba0c', 'c8024d09-09de-474b-91ec-986562143d24', 'adjacent', 60, 'Unmapped source tokens: LaunchTech', now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '3c25b918-7bf4-4fec-81f8-8161df96ba0c', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, 'Unmapped source tokens: LaunchTech', now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '3c25b918-7bf4-4fec-81f8-8161df96ba0c', 'ead6bd90-f29a-42c0-a704-52ea5175d4e0', 'adjacent', 60, 'Unmapped source tokens: LaunchTech', now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '3c25b918-7bf4-4fec-81f8-8161df96ba0c', 'f067a804-b0d3-4bbe-8301-11dbb5f85bc5', 'adjacent', 60, 'Unmapped source tokens: LaunchTech', now(), true);

-- Underground Group
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('75c28acc-1b67-47e6-9c88-5378b12e12f8', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Underground Group', 'underground', 'https://www.theundergroundgroup.com/', null, null, null, null, 60, 'pending_review', 'Connect!Row11', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '75c28acc-1b67-47e6-9c88-5378b12e12f8', 'positioning', 'strength', '{"kind":"strength","text":"Authentic Content. Compelling Stories.\r\n\r\nWe help brands break through the noise, generate more brand love, and consistently engage with their audiences through high-quality content creation at scale in all formats and for all platforms."}'::jsonb, 'Authentic Content. Compelling Stories.

We help brands break through the noise, generate more brand love, and consistently engage with their audiences through high-quality content creation at scale in all formats and for all platforms.', 60, 'import', 'pending');
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '75c28acc-1b67-47e6-9c88-5378b12e12f8', 'positioning', 'weakness', '{"kind":"weakness","text":"focused on textual and video content creation for demand generation"}'::jsonb, 'focused on textual and video content creation for demand generation', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('eff9a6ab-7ddd-4352-bf49-40a51756fe42', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '75c28acc-1b67-47e6-9c88-5378b12e12f8', 'www.theundergroundgroup.com/services', 'www theundergroundgroup com services', 'https://www.theundergroundgroup.com/services', 60, 'pending_review', 'Connect!Row11', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '75c28acc-1b67-47e6-9c88-5378b12e12f8', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '75c28acc-1b67-47e6-9c88-5378b12e12f8', 'e3ec49d7-1d59-4e74-bfff-44edfd1853b5', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '75c28acc-1b67-47e6-9c88-5378b12e12f8', 'b07777f9-e2ba-4814-a96b-fcf6ef02d1f2', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '75c28acc-1b67-47e6-9c88-5378b12e12f8', 'ead6bd90-f29a-42c0-a704-52ea5175d4e0', 'adjacent', 60, null, now(), true);
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '75c28acc-1b67-47e6-9c88-5378b12e12f8', '746de778-bbb8-4d95-8e1f-48f7df4cc191', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '75c28acc-1b67-47e6-9c88-5378b12e12f8', '3f4095e5-7f8f-4d24-aead-eccee2098fe7', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '75c28acc-1b67-47e6-9c88-5378b12e12f8', '9b602935-efae-408b-be2d-527dc2c29947', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '75c28acc-1b67-47e6-9c88-5378b12e12f8', '2e4a7ed1-2469-4cdd-b195-a4c7f9b91ca4', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '75c28acc-1b67-47e6-9c88-5378b12e12f8', '07eee21b-bb52-407a-9f10-89b73e505941', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '75c28acc-1b67-47e6-9c88-5378b12e12f8', 'df22d231-4c0b-4072-b383-9d102978790c', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '75c28acc-1b67-47e6-9c88-5378b12e12f8', '921b721a-747e-4bb9-b91e-ece03e4fec36', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '75c28acc-1b67-47e6-9c88-5378b12e12f8', '74e86913-1ffc-4e9d-9ed8-74bb692cd398', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '75c28acc-1b67-47e6-9c88-5378b12e12f8', 'fdd03d6f-347c-472f-8115-d7edadd3419f', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '75c28acc-1b67-47e6-9c88-5378b12e12f8', '2d72cbd6-a41a-4e34-baad-33ffa9715a12', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '75c28acc-1b67-47e6-9c88-5378b12e12f8', 'e9913e1c-0a3b-4880-b738-2a371fe31756', 'unknown', 60, now());

-- Demo-Force
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('eab528d0-9348-4812-98b9-4b7ee642a12c', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Demo-Force', 'demo force', 'https://www.demo-force.com/', null, null, null, null, 60, 'pending_review', 'Connect!Row12', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'eab528d0-9348-4812-98b9-4b7ee642a12c', 'positioning', 'strength', '{"kind":"strength","text":"Demo-Force connects with all your favorite tools to seamlessly supercharge your existing workflows with prospect analytics. By enabling on-demand, virtual demos and tests, you are creating a critical opportunity for technical and economic buyers to share, get aligned, and get behind investments"}'::jsonb, 'Demo-Force connects with all your favorite tools to seamlessly supercharge your existing workflows with prospect analytics. By enabling on-demand, virtual demos and tests, you are creating a critical opportunity for technical and economic buyers to share, get aligned, and get behind investments', 60, 'import', 'pending');
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'eab528d0-9348-4812-98b9-4b7ee642a12c', 'positioning', 'weakness', '{"kind":"weakness","text":"Focused on product demos"}'::jsonb, 'Focused on product demos', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'eab528d0-9348-4812-98b9-4b7ee642a12c', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'eab528d0-9348-4812-98b9-4b7ee642a12c', '89898124-dec2-44d0-aec2-4a0c9dcdb772', 'adjacent', 60, null, now(), true);

-- Amped
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('4cedc2f9-0e56-4931-848f-f19f410771c5', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Amped', 'amped', 'https://www.ampedmktg.com/', null, null, null, null, 60, 'pending_review', 'Connect!Row13', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4cedc2f9-0e56-4931-848f-f19f410771c5', 'positioning', 'strength', '{"kind":"strength","text":"AI Bringing EQ Back into Cold Outreach\r\nAMPED is finding the voice of your customers and allowing your company to communicate in the way that corresponds with your prospect or customer"}'::jsonb, 'AI Bringing EQ Back into Cold Outreach
AMPED is finding the voice of your customers and allowing your company to communicate in the way that corresponds with your prospect or customer', 60, 'import', 'pending');
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4cedc2f9-0e56-4931-848f-f19f410771c5', 'positioning', 'weakness', '{"kind":"weakness","text":"Focused on AI-powered ABM"}'::jsonb, 'Focused on AI-powered ABM', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4cedc2f9-0e56-4931-848f-f19f410771c5', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4cedc2f9-0e56-4931-848f-f19f410771c5', '89898124-dec2-44d0-aec2-4a0c9dcdb772', 'adjacent', 60, null, now(), true);

-- Directive
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('fa5a4a4c-d7cd-4454-a8e7-fedd73aed657', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Directive', 'directive', 'https://directiveconsulting.com/', null, null, null, null, 60, 'pending_review', 'Connect!Row14', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'fa5a4a4c-d7cd-4454-a8e7-fedd73aed657', 'positioning', 'strength', '{"kind":"strength","text":"Performance marketing agency for tech\r\nbrands that generates pipeline and revenue"}'::jsonb, 'Performance marketing agency for tech
brands that generates pipeline and revenue', 60, 'import', 'pending');
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'fa5a4a4c-d7cd-4454-a8e7-fedd73aed657', 'positioning', 'weakness', '{"kind":"weakness","text":"Customer Generation powered by a deep understanding of your ideal customer segments, and leverages this knowledge to create a competitive advantage through marketing and product innovation.\r\n\r\n1st Party Data Unlocks Customer Growth\r\nWe map your Total Addressable Market (TAM), build account lists, and aggressively scale spend. 1st party data not only future-proofs your campaigns; but also gives you the confidence to grow brand advertising because every impression delivered will be a future customer.\r\n\r\nIntegrated Performance Marketing Converts Demand\r\nWhen your customers are ready to research, compare, and purchase (as a result of brand initiatives), integrated performance marketing ensures their experience is omni-channel, consistent, and personalized. This is how we convert demand into Customer Generation."}'::jsonb, 'Customer Generation powered by a deep understanding of your ideal customer segments, and leverages this knowledge to create a competitive advantage through marketing and product innovation.

1st Party Data Unlocks Customer Growth
We map your Total Addressable Market (TAM), build account lists, and aggressively scale spend. 1st party data not only future-proofs your campaigns; but also gives you the confidence to grow brand advertising because every impression delivered will be a future customer.

Integrated Performance Marketing Converts Demand
When your customers are ready to research, compare, and purchase (as a result of brand initiatives), integrated performance marketing ensures their experience is omni-channel, consistent, and personalized. This is how we convert demand into Customer Generation.', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('b636db41-a6a6-4a4b-b4e9-b1f60fbce9e2', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'fa5a4a4c-d7cd-4454-a8e7-fedd73aed657', 'directiveconsulting.com/customer-generation', 'directiveconsulting com customer generation', 'https://directiveconsulting.com/customer-generation/', 60, 'pending_review', 'Connect!Row14', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b636db41-a6a6-4a4b-b4e9-b1f60fbce9e2', 99, 99, 'USD', 'Online marketing courses $99/month
The Full Course Includes:
40+ video tutorials
Over 13 hours of video content
Unlimited access to tools & templates
Interactive quizzes
Certification

4 Trial Lessons
Free
NO CREDIT CARD REQUIRED
The Free Lessons Include:
4 video tutorials
2 Free PPC Lessons
2 Free SEO Lessons
Landing page template
On-Page SEO tools, templates, examples', 60, now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'fa5a4a4c-d7cd-4454-a8e7-fedd73aed657', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'fa5a4a4c-d7cd-4454-a8e7-fedd73aed657', '89898124-dec2-44d0-aec2-4a0c9dcdb772', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'fa5a4a4c-d7cd-4454-a8e7-fedd73aed657', 'e3ec49d7-1d59-4e74-bfff-44edfd1853b5', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'fa5a4a4c-d7cd-4454-a8e7-fedd73aed657', 'b07777f9-e2ba-4814-a96b-fcf6ef02d1f2', 'adjacent', 60, null, now(), true);
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'fa5a4a4c-d7cd-4454-a8e7-fedd73aed657', '29cfae5e-c5ba-4997-8bdc-4e2dc240be93', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'fa5a4a4c-d7cd-4454-a8e7-fedd73aed657', 'dea35ed4-11e5-4f4c-b074-5cb75c645507', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'fa5a4a4c-d7cd-4454-a8e7-fedd73aed657', '5bfe6d86-ec2e-45f3-bbe5-ad2b84947e99', 'unknown', 60, now());

-- CyberWire
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('9612a0f5-cbad-4c07-a350-dd5519c34403', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'CyberWire', 'cyberwire', 'https://thecyberwire.com/', null, null, null, null, 60, 'pending_review', 'Connect!Row15', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '9612a0f5-cbad-4c07-a350-dd5519c34403', 'positioning', 'strength', '{"kind":"strength","text":"Actionable reporting, analysis & insights on cyber events all at your fingertips."}'::jsonb, 'Actionable reporting, analysis & insights on cyber events all at your fingertips.', 60, 'import', 'pending');
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '9612a0f5-cbad-4c07-a350-dd5519c34403', 'positioning', 'weakness', '{"kind":"weakness","text":"sponsorship news model"}'::jsonb, 'sponsorship news model', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('111dd894-8061-4916-a444-75774a200ee3', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '9612a0f5-cbad-4c07-a350-dd5519c34403', 'sponsor.thecyberwire.com', 'sponsor thecyberwire com', 'https://sponsor.thecyberwire.com/', 60, 'pending_review', 'Connect!Row15', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '111dd894-8061-4916-a444-75774a200ee3', 9.99, 319.99, 'USD', 'CyberWire Pro
Exclusive podcasts, briefings, articles, and events.
Ad-free versions of our public podcasts.
Participation in live virtual events.
Unlimited access to podcast & briefing archives.
Unlimited access to transcript archives.
Monthly Subscription
$31.99
$9.99 USD

Annual Subscription
$319.99
$99 USD', 60, now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '9612a0f5-cbad-4c07-a350-dd5519c34403', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '9612a0f5-cbad-4c07-a350-dd5519c34403', 'c658d81e-490d-40f3-b8fc-3df0dd8e5587', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '9612a0f5-cbad-4c07-a350-dd5519c34403', 'ead6bd90-f29a-42c0-a704-52ea5175d4e0', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '9612a0f5-cbad-4c07-a350-dd5519c34403', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '9612a0f5-cbad-4c07-a350-dd5519c34403', 'f067a804-b0d3-4bbe-8301-11dbb5f85bc5', 'adjacent', 60, null, now(), true);

-- N2K Cyber
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('205a5030-54d2-4ab4-9b0b-eee2bdca1f1a', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'N2K Cyber', 'n2k cyber', 'https://www.n2k.com/', null, null, null, null, 60, 'pending_review', 'Connect!Row16', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '205a5030-54d2-4ab4-9b0b-eee2bdca1f1a', 'positioning', 'strength', '{"kind":"strength","text":"All-in-one cybersecurity workforce intelligence partner.\r\nWe make you smart about your workforce while making your workforce smarter.\r\n\r\nWe integrate data analysis models, industry benchmarks, and your organizational blueprint to surface gaps and help you make smarter, faster decisions on attracting and retaining talent. Solutions include cross-team skills gap analysis, job role profiling, career roadmaps, job description support, and more."}'::jsonb, 'All-in-one cybersecurity workforce intelligence partner.
We make you smart about your workforce while making your workforce smarter.

We integrate data analysis models, industry benchmarks, and your organizational blueprint to surface gaps and help you make smarter, faster decisions on attracting and retaining talent. Solutions include cross-team skills gap analysis, job role profiling, career roadmaps, job description support, and more.', 60, 'import', 'pending');
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '205a5030-54d2-4ab4-9b0b-eee2bdca1f1a', 'positioning', 'weakness', '{"kind":"weakness","text":"Focused on training and development"}'::jsonb, 'Focused on training and development', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '205a5030-54d2-4ab4-9b0b-eee2bdca1f1a', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '205a5030-54d2-4ab4-9b0b-eee2bdca1f1a', 'f067a804-b0d3-4bbe-8301-11dbb5f85bc5', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '205a5030-54d2-4ab4-9b0b-eee2bdca1f1a', 'b07777f9-e2ba-4814-a96b-fcf6ef02d1f2', 'adjacent', 60, null, now(), true);

-- NorthPoint
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('ac918b0b-1b4b-443a-acb8-3cdc4366ad28', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'NorthPoint', 'northpoint', 'https://northpointmarketing.com/', null, null, null, null, 60, 'pending_review', 'Connect!Row17', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ac918b0b-1b4b-443a-acb8-3cdc4366ad28', 'positioning', 'strength', '{"kind":"strength","text":"North Point is your trusted agency, dedicated to providing targeted and cost-effective telemarketing solutions that seamlessly integrate into your overall marketing and sales strategies. Our comprehensive services include specialized IT, hospitality, and financial services telemarketing, appointment setting, lead generation, database construction and cleansing, surveys, market research, event planning, promotions, and post-campaign follow-up calls.\r\nOutsourcing your telemarketing campaigns has become a central cog in the wheel of modern marketing strategies as it empowers businesses to meet their telemarketing and telesales needs without the complexity of hiring, training, equipping, and managing in-house staff. \r\nWith the proper knowledge, training, and preparation, outsourced telemarketing agents become part of your internal sales team, driving your organization''s success, sales, and growth."}'::jsonb, 'North Point is your trusted agency, dedicated to providing targeted and cost-effective telemarketing solutions that seamlessly integrate into your overall marketing and sales strategies. Our comprehensive services include specialized IT, hospitality, and financial services telemarketing, appointment setting, lead generation, database construction and cleansing, surveys, market research, event planning, promotions, and post-campaign follow-up calls.
Outsourcing your telemarketing campaigns has become a central cog in the wheel of modern marketing strategies as it empowers businesses to meet their telemarketing and telesales needs without the complexity of hiring, training, equipping, and managing in-house staff. 
With the proper knowledge, training, and preparation, outsourced telemarketing agents become part of your internal sales team, driving your organization''s success, sales, and growth.', 60, 'import', 'pending');
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ac918b0b-1b4b-443a-acb8-3cdc4366ad28', 'positioning', 'weakness', '{"kind":"weakness","text":"No case studies, or social proof"}'::jsonb, 'No case studies, or social proof', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('8b1d991a-e121-4619-9b6f-08df24bd0cbd', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ac918b0b-1b4b-443a-acb8-3cdc4366ad28', 'northpointmarketing.com/event-marketing', 'northpointmarketing com event marketing', 'https://northpointmarketing.com/event-marketing', 60, 'pending_review', 'Connect!Row17', now());
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('3b966c73-e6e9-4f06-9d60-b02066616c07', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ac918b0b-1b4b-443a-acb8-3cdc4366ad28', 'northpointmarketing.com/research', 'northpointmarketing com research', 'https://northpointmarketing.com/research', 60, 'pending_review', 'Connect!Row17', now());
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('bf579e48-516e-4c11-a691-9bcf624a8da8', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ac918b0b-1b4b-443a-acb8-3cdc4366ad28', 'northpointmarketing.com/content-creation', 'northpointmarketing com content creation', 'https://northpointmarketing.com/content-creation', 60, 'pending_review', 'Connect!Row17', now());
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('381f49c1-f389-408e-ae97-91d41b18a8ae', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ac918b0b-1b4b-443a-acb8-3cdc4366ad28', 'northpointmarketing.com/email-marketing', 'northpointmarketing com email marketing', 'https://northpointmarketing.com/email-marketing', 60, 'pending_review', 'Connect!Row17', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ac918b0b-1b4b-443a-acb8-3cdc4366ad28', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, 'Unmapped source tokens: Email. Research', now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ac918b0b-1b4b-443a-acb8-3cdc4366ad28', 'e3ec49d7-1d59-4e74-bfff-44edfd1853b5', 'adjacent', 60, 'Unmapped source tokens: Email. Research', now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ac918b0b-1b4b-443a-acb8-3cdc4366ad28', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, 'Unmapped source tokens: Email. Research', now(), true);

-- Foundry
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('76480e22-5713-40da-8095-72f59c61dfd8', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Foundry', 'foundry', 'https://foundryco.com/', null, null, null, null, 60, 'pending_review', 'Connect!Row18; Events!Row19', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '76480e22-5713-40da-8095-72f59c61dfd8', 'positioning', 'strength', '{"kind":"strength","text":"We help tech marketers connect with and address the full buying team."}'::jsonb, 'We help tech marketers connect with and address the full buying team.', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('cb9ac436-452e-486b-ac7c-cd3afa470e0f', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '76480e22-5713-40da-8095-72f59c61dfd8', 'foundryco.com/our-brands', 'foundryco com our brands', 'https://foundryco.com/our-brands/', 60, 'pending_review', 'Connect!Row18', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '76480e22-5713-40da-8095-72f59c61dfd8', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, 'Unmapped source tokens: topic-based, LaunchTech', now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '76480e22-5713-40da-8095-72f59c61dfd8', '89898124-dec2-44d0-aec2-4a0c9dcdb772', 'adjacent', 60, 'Unmapped source tokens: topic-based, LaunchTech', now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '76480e22-5713-40da-8095-72f59c61dfd8', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, 'Unmapped source tokens: topic-based, LaunchTech', now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '76480e22-5713-40da-8095-72f59c61dfd8', 'e3ec49d7-1d59-4e74-bfff-44edfd1853b5', 'adjacent', 60, 'Unmapped source tokens: topic-based, LaunchTech', now(), true);
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '76480e22-5713-40da-8095-72f59c61dfd8', '941ac48b-7bf5-47c7-bca6-5f4c1805e5ef', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '76480e22-5713-40da-8095-72f59c61dfd8', 'a817dc99-1bb9-444e-889f-fdeb5fefe3b5', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '76480e22-5713-40da-8095-72f59c61dfd8', '746de778-bbb8-4d95-8e1f-48f7df4cc191', 'unknown', 60, now());

-- JoTo PR
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('b837b8fd-9db0-42b0-9c8b-fcade42fcf08', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'JoTo PR', 'joto pr', 'https://jotopr.com/', null, null, null, null, 60, 'pending_review', 'Connect!Row19', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b837b8fd-9db0-42b0-9c8b-fcade42fcf08', 'positioning', 'strength', '{"kind":"strength","text":"\"Anti-PR\" “Anti-PR is really the difference between the existing apathy of the industry publicizing fluffy, no-result PR vs. our intolerance of mediocrity and our demand, skill and mastery in obtaining results.”\r\nCrisis Management"}'::jsonb, '"Anti-PR" “Anti-PR is really the difference between the existing apathy of the industry publicizing fluffy, no-result PR vs. our intolerance of mediocrity and our demand, skill and mastery in obtaining results.”
Crisis Management', 60, 'import', 'pending');
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b837b8fd-9db0-42b0-9c8b-fcade42fcf08', 'positioning', 'weakness', '{"kind":"weakness","text":"Offerings are a little more generalized rather than focused on cybersecurity"}'::jsonb, 'Offerings are a little more generalized rather than focused on cybersecurity', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b837b8fd-9db0-42b0-9c8b-fcade42fcf08', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, 'Unmapped source tokens: LaunchTech', now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b837b8fd-9db0-42b0-9c8b-fcade42fcf08', 'c8024d09-09de-474b-91ec-986562143d24', 'adjacent', 60, 'Unmapped source tokens: LaunchTech', now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b837b8fd-9db0-42b0-9c8b-fcade42fcf08', 'e3ec49d7-1d59-4e74-bfff-44edfd1853b5', 'adjacent', 60, 'Unmapped source tokens: LaunchTech', now(), true);

-- BNO
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('113245ed-29c6-40bf-b800-5dcbf24de4c5', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'BNO', 'bno', 'https://bnoinc.com/', null, null, null, null, 60, 'pending_review', 'Connect!Row20', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '113245ed-29c6-40bf-b800-5dcbf24de4c5', 'positioning', 'strength', '{"kind":"strength","text":"We work with you to evolve your brand narrative, make complex stories compelling, and create expertly crafted content deployed across owned, earned, and shared platforms."}'::jsonb, 'We work with you to evolve your brand narrative, make complex stories compelling, and create expertly crafted content deployed across owned, earned, and shared platforms.', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '113245ed-29c6-40bf-b800-5dcbf24de4c5', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, 'Unmapped source tokens: LaunchTech', now(), true);
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '113245ed-29c6-40bf-b800-5dcbf24de4c5', '5fde5c22-3fe6-4e43-b643-2db049b7fa03', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '113245ed-29c6-40bf-b800-5dcbf24de4c5', '34895802-05a6-4e64-b28b-118dc49de61b', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '113245ed-29c6-40bf-b800-5dcbf24de4c5', '0c1075a8-0fb9-4b83-bbcb-fe721bfd3c88', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '113245ed-29c6-40bf-b800-5dcbf24de4c5', '8066c13e-afff-43a4-99c2-7586ee9282c4', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '113245ed-29c6-40bf-b800-5dcbf24de4c5', '3b1128fa-26ff-4019-9d4e-af4d730e03d3', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '113245ed-29c6-40bf-b800-5dcbf24de4c5', '00734091-02da-45f0-9662-3219068396e1', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '113245ed-29c6-40bf-b800-5dcbf24de4c5', 'd80e9886-a87f-4124-b250-92e4c5a296fa', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '113245ed-29c6-40bf-b800-5dcbf24de4c5', '7e1012df-efa6-4158-8cee-61ed684e31ea', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '113245ed-29c6-40bf-b800-5dcbf24de4c5', '6de03a20-ae50-425d-a45e-e765a510ba55', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '113245ed-29c6-40bf-b800-5dcbf24de4c5', 'de84d41e-e9f9-410e-87a1-14039260dce4', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '113245ed-29c6-40bf-b800-5dcbf24de4c5', '9000f329-ce71-4ede-bda8-4be14181bfdf', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '113245ed-29c6-40bf-b800-5dcbf24de4c5', '11cde1e8-a41f-4f0d-89a3-f279ddbff8d1', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '113245ed-29c6-40bf-b800-5dcbf24de4c5', 'e6afdc96-cfee-4a5b-b33d-0d86d71c952d', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '113245ed-29c6-40bf-b800-5dcbf24de4c5', '289fcb94-125c-48d8-aaf0-9157f8396584', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '113245ed-29c6-40bf-b800-5dcbf24de4c5', 'bed694f2-ef86-4be1-bcbc-1b7ee48a89b6', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '113245ed-29c6-40bf-b800-5dcbf24de4c5', '18f325c5-5c47-47e9-b883-4a2f3c9da9fe', 'unknown', 60, now());

-- Hushly
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('be528efc-1b95-4eee-bccd-f26632235c48', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Hushly', 'hushly', 'https://www.hushly.com/', null, null, null, null, 60, 'pending_review', 'Connect!Row21', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'be528efc-1b95-4eee-bccd-f26632235c48', 'positioning', 'strength', '{"kind":"strength","text":"Hushly is the only all-in-one conversion cloud designed to improve\r\nbuyer experiences and drive conversions for B2B marketers."}'::jsonb, 'Hushly is the only all-in-one conversion cloud designed to improve
buyer experiences and drive conversions for B2B marketers.', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('9e623181-2316-4f7e-982d-c5ee4ebd0531', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'be528efc-1b95-4eee-bccd-f26632235c48', 'www.hushly.com/account-based-experiences', 'www hushly com account based experiences', 'https://www.hushly.com/account-based-experiences/', 60, 'pending_review', 'Connect!Row21', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '9e623181-2316-4f7e-982d-c5ee4ebd0531', 0.24, 1700, 'USD', 'The pricing for Hushly starts at $0.24  per per view. Hushly has 3 different plans:
Content Views (CPM) at $0.24. 
Lead Conversion (CPL) at $20.00. 
Account Based (ABM) at $1700.00 per month. 

Content Views (CPM) $0.24 per view
$0.24 - 0.15 Price based on total content views (4,000 – 55,000 per month)
Features
No Setup Fees
No Platform or Software Fees
Unlimited User Licenses
Unlimited number of Content Hubs, Content Streams, Embed Streams, and Landing Pages
Unlimited Training Hours
Unlimited Professional Services Support
Personalization with AI powered recommendations
Dedicated Customer Success Manager
Free ABM Vendor Integration (6sense, RollWorks, Demandbase)
Free Intent Vendor Integration (Bombora, ARM TreasureData)

Lead Conversion (CPL) $20.00 per lead
$20 - 17 Cost Per Lead (CPL)
$7 - $10 Cost Per Lead (CPL)
Features
No Setup Fees
No Platform or Software Fees
Unlimited User Licenses
Unlimited number of non-Hushly hosted pages, Content Hubs, Content Streams, Embed Streams, Landing Pages, and MicroForms
Unlimited Training Hours
Unlimited Professional Services Support
Personalization with AI powered recommendations
Dedicated Customer Success Manger
Free ABM Vendor Integration (6sense, RollWorks, Demandbase)
Free Intent Vendor Integration (Bombora, ARM TreasureData)
Enriched and Human-Verified Business Profiles

Account Based (ABM) $1,700.00 per month
$1,700 per month billed annually
Features
No Setup Fees
No Platform or Software Fees
Unlimited User Licenses
Unlimited ABM campaign pages per account
Unlimited Training Hours
Unlimited Professional Services Support
Account Personalization
Unlimited Leads & Content Views
Ability to gate or un-gate any individual content
Dedicated Customer Success Manager
Free ABM Vendor Integration (6sense, RollWorks, Demandbase, Integrate)
Free Intent Vendor Integration (Bombora, ARM TreasureData)
Free Enriched and Human-Verfied Business Profiles
25 Accounts Included', 60, now());
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('dc6fadbb-1e1d-4cdf-9f13-08efed223439', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'be528efc-1b95-4eee-bccd-f26632235c48', 'www.hushly.com/content-marketing', 'www hushly com content marketing', 'https://www.hushly.com/content-marketing/', 60, 'pending_review', 'Connect!Row21', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'dc6fadbb-1e1d-4cdf-9f13-08efed223439', 0.24, 1700, 'USD', 'The pricing for Hushly starts at $0.24  per per view. Hushly has 3 different plans:
Content Views (CPM) at $0.24. 
Lead Conversion (CPL) at $20.00. 
Account Based (ABM) at $1700.00 per month. 

Content Views (CPM) $0.24 per view
$0.24 - 0.15 Price based on total content views (4,000 – 55,000 per month)
Features
No Setup Fees
No Platform or Software Fees
Unlimited User Licenses
Unlimited number of Content Hubs, Content Streams, Embed Streams, and Landing Pages
Unlimited Training Hours
Unlimited Professional Services Support
Personalization with AI powered recommendations
Dedicated Customer Success Manager
Free ABM Vendor Integration (6sense, RollWorks, Demandbase)
Free Intent Vendor Integration (Bombora, ARM TreasureData)

Lead Conversion (CPL) $20.00 per lead
$20 - 17 Cost Per Lead (CPL)
$7 - $10 Cost Per Lead (CPL)
Features
No Setup Fees
No Platform or Software Fees
Unlimited User Licenses
Unlimited number of non-Hushly hosted pages, Content Hubs, Content Streams, Embed Streams, Landing Pages, and MicroForms
Unlimited Training Hours
Unlimited Professional Services Support
Personalization with AI powered recommendations
Dedicated Customer Success Manger
Free ABM Vendor Integration (6sense, RollWorks, Demandbase)
Free Intent Vendor Integration (Bombora, ARM TreasureData)
Enriched and Human-Verified Business Profiles

Account Based (ABM) $1,700.00 per month
$1,700 per month billed annually
Features
No Setup Fees
No Platform or Software Fees
Unlimited User Licenses
Unlimited ABM campaign pages per account
Unlimited Training Hours
Unlimited Professional Services Support
Account Personalization
Unlimited Leads & Content Views
Ability to gate or un-gate any individual content
Dedicated Customer Success Manager
Free ABM Vendor Integration (6sense, RollWorks, Demandbase, Integrate)
Free Intent Vendor Integration (Bombora, ARM TreasureData)
Free Enriched and Human-Verfied Business Profiles
25 Accounts Included', 60, now());
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('f1cc5993-c32f-48c5-b55a-e3bbb53fa1c0', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'be528efc-1b95-4eee-bccd-f26632235c48', 'www.hushly.com/demand-capture', 'www hushly com demand capture', 'https://www.hushly.com/demand-capture/', 60, 'pending_review', 'Connect!Row21', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'f1cc5993-c32f-48c5-b55a-e3bbb53fa1c0', 0.24, 1700, 'USD', 'The pricing for Hushly starts at $0.24  per per view. Hushly has 3 different plans:
Content Views (CPM) at $0.24. 
Lead Conversion (CPL) at $20.00. 
Account Based (ABM) at $1700.00 per month. 

Content Views (CPM) $0.24 per view
$0.24 - 0.15 Price based on total content views (4,000 – 55,000 per month)
Features
No Setup Fees
No Platform or Software Fees
Unlimited User Licenses
Unlimited number of Content Hubs, Content Streams, Embed Streams, and Landing Pages
Unlimited Training Hours
Unlimited Professional Services Support
Personalization with AI powered recommendations
Dedicated Customer Success Manager
Free ABM Vendor Integration (6sense, RollWorks, Demandbase)
Free Intent Vendor Integration (Bombora, ARM TreasureData)

Lead Conversion (CPL) $20.00 per lead
$20 - 17 Cost Per Lead (CPL)
$7 - $10 Cost Per Lead (CPL)
Features
No Setup Fees
No Platform or Software Fees
Unlimited User Licenses
Unlimited number of non-Hushly hosted pages, Content Hubs, Content Streams, Embed Streams, Landing Pages, and MicroForms
Unlimited Training Hours
Unlimited Professional Services Support
Personalization with AI powered recommendations
Dedicated Customer Success Manger
Free ABM Vendor Integration (6sense, RollWorks, Demandbase)
Free Intent Vendor Integration (Bombora, ARM TreasureData)
Enriched and Human-Verified Business Profiles

Account Based (ABM) $1,700.00 per month
$1,700 per month billed annually
Features
No Setup Fees
No Platform or Software Fees
Unlimited User Licenses
Unlimited ABM campaign pages per account
Unlimited Training Hours
Unlimited Professional Services Support
Account Personalization
Unlimited Leads & Content Views
Ability to gate or un-gate any individual content
Dedicated Customer Success Manager
Free ABM Vendor Integration (6sense, RollWorks, Demandbase, Integrate)
Free Intent Vendor Integration (Bombora, ARM TreasureData)
Free Enriched and Human-Verfied Business Profiles
25 Accounts Included', 60, now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'be528efc-1b95-4eee-bccd-f26632235c48', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, 'Unmapped source tokens: CRA Connect: ABM', now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'be528efc-1b95-4eee-bccd-f26632235c48', 'e3ec49d7-1d59-4e74-bfff-44edfd1853b5', 'adjacent', 60, 'Unmapped source tokens: CRA Connect: ABM', now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'be528efc-1b95-4eee-bccd-f26632235c48', '89898124-dec2-44d0-aec2-4a0c9dcdb772', 'adjacent', 60, 'Unmapped source tokens: CRA Connect: ABM', now(), true);

-- Revenue River - now an Instrumental Group Company
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('1376e0c5-ab55-4616-92ff-4dea543466de', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Revenue River - now an Instrumental Group Company', 'revenue river now an instrumental', 'https://www.revenueriver.co/', null, null, null, null, 60, 'pending_review', 'Connect!Row22', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '1376e0c5-ab55-4616-92ff-4dea543466de', 'positioning', 'strength', '{"kind":"strength","text":"HubSpot expertise"}'::jsonb, 'HubSpot expertise', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('b74c0151-8431-49c9-ab78-0336cb3726f7', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '1376e0c5-ab55-4616-92ff-4dea543466de', 'www.revenueriver.co/digital-growth', 'www revenueriver digital growth', 'https://www.revenueriver.co/digital-growth', 60, 'pending_review', 'Connect!Row22', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b74c0151-8431-49c9-ab78-0336cb3726f7', 150, 49000, 'USD', 'Min. project size $5,000+
Avg. hourly rate $150 - $199 / hr
Most Common Project Size $10,000 to $49,000', 60, now());
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('796ec8d4-4dd2-4fb9-be23-1206955a695f', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '1376e0c5-ab55-4616-92ff-4dea543466de', 'www.revenueriver.co/hubspot-overview', 'www revenueriver hubspot overview', 'https://www.revenueriver.co/hubspot-overview', 60, 'pending_review', 'Connect!Row22', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '796ec8d4-4dd2-4fb9-be23-1206955a695f', 150, 49000, 'USD', 'Min. project size $5,000+
Avg. hourly rate $150 - $199 / hr
Most Common Project Size $10,000 to $49,000', 60, now());
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('67a8a911-e298-4154-bc7c-90ec91e30ac7', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '1376e0c5-ab55-4616-92ff-4dea543466de', 'www.revenueriver.co/website-services', 'www revenueriver website services', 'https://www.revenueriver.co/website-services', 60, 'pending_review', 'Connect!Row22', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '67a8a911-e298-4154-bc7c-90ec91e30ac7', 150, 49000, 'USD', 'Min. project size $5,000+
Avg. hourly rate $150 - $199 / hr
Most Common Project Size $10,000 to $49,000', 60, now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '1376e0c5-ab55-4616-92ff-4dea543466de', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, null, now(), true);

-- Ignitum
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('00b81ba4-b014-4419-89ee-dedb9d2dfc35', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Ignitum', 'ignitum', 'https://www.ignitium.com/', null, null, null, null, 60, 'pending_review', 'Connect!Row23', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '00b81ba4-b014-4419-89ee-dedb9d2dfc35', 'positioning', 'strength', '{"kind":"strength","text":"ABX-heavy\r\ndrive engagement and pipeline at scale with the combination of partner tech, AI, and humans."}'::jsonb, 'ABX-heavy
drive engagement and pipeline at scale with the combination of partner tech, AI, and humans.', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('a6d34418-341b-44cf-9026-172062938ba8', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '00b81ba4-b014-4419-89ee-dedb9d2dfc35', 'www.ignitium.com/abx-orchestration', 'www ignitium com abx orchestration', 'https://www.ignitium.com/abx-orchestration', 60, 'pending_review', 'Connect!Row23', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '00b81ba4-b014-4419-89ee-dedb9d2dfc35', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '00b81ba4-b014-4419-89ee-dedb9d2dfc35', '89898124-dec2-44d0-aec2-4a0c9dcdb772', 'adjacent', 60, null, now(), true);
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '00b81ba4-b014-4419-89ee-dedb9d2dfc35', '7bb656ba-6f6f-4bb2-bebc-d99d9e72f98c', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '00b81ba4-b014-4419-89ee-dedb9d2dfc35', '271cd2da-249d-433e-9214-7b9e8ef5c62d', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '00b81ba4-b014-4419-89ee-dedb9d2dfc35', '5114efb0-a92c-4662-8743-c56046678378', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '00b81ba4-b014-4419-89ee-dedb9d2dfc35', '04547c3b-dd59-4ef3-86dd-88bcc52bd3d6', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '00b81ba4-b014-4419-89ee-dedb9d2dfc35', '62672917-61f0-403c-90ae-39b2577cbac9', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '00b81ba4-b014-4419-89ee-dedb9d2dfc35', 'cf84ea12-a432-49e2-9b3d-bc2274390a7f', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '00b81ba4-b014-4419-89ee-dedb9d2dfc35', '569f2b90-e4d8-4ce7-9983-5a1434923a67', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '00b81ba4-b014-4419-89ee-dedb9d2dfc35', '2c199982-cf81-492d-b648-0f2edc21b69c', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '00b81ba4-b014-4419-89ee-dedb9d2dfc35', '08d6feef-f286-472c-82e8-99ad7d8b7b29', 'unknown', 60, now());

-- Ironpaper
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('a61483fc-4a26-4927-b1b0-7376aa61eedb', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Ironpaper', 'ironpaper', 'https://www.ironpaper.com/', null, null, null, null, 60, 'pending_review', 'Connect!Row24', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'a61483fc-4a26-4927-b1b0-7376aa61eedb', 'positioning', 'strength', '{"kind":"strength","text":"We generate leads and smarter revenue for B2B companies with a long or complex sales process."}'::jsonb, 'We generate leads and smarter revenue for B2B companies with a long or complex sales process.', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('2b35fdc4-1845-46a0-aa4e-6a236ab47e9a', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'a61483fc-4a26-4927-b1b0-7376aa61eedb', 'www.ironpaper.com/b2b-marketing', 'www ironpaper com b2b marketing', 'https://www.ironpaper.com/b2b-marketing/', 60, 'pending_review', 'Connect!Row24', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '2b35fdc4-1845-46a0-aa4e-6a236ab47e9a', 150, 10000, 'USD', '$150 - $199 / hr
Min. project size $10,000+', 60, now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'a61483fc-4a26-4927-b1b0-7376aa61eedb', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'a61483fc-4a26-4927-b1b0-7376aa61eedb', '89898124-dec2-44d0-aec2-4a0c9dcdb772', 'adjacent', 60, null, now(), true);
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'a61483fc-4a26-4927-b1b0-7376aa61eedb', '250dec03-f1f6-4f78-8c49-96d8ee27db83', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'a61483fc-4a26-4927-b1b0-7376aa61eedb', '4fa931e7-06ae-4c39-9a45-19963ff92327', 'unknown', 60, now());

-- getuplead
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('dabfe21d-4763-436a-8285-c2008f751cea', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'getuplead', 'getuplead', 'https://getuplead.com/', null, null, null, null, 60, 'pending_review', 'Connect!Row25', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'dabfe21d-4763-436a-8285-c2008f751cea', 'positioning', 'strength', '{"kind":"strength","text":"We help B2B & SaaS companies to get more clients with PPC and LinkedIn Ads"}'::jsonb, 'We help B2B & SaaS companies to get more clients with PPC and LinkedIn Ads', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('017b452d-e94d-404a-8bc3-a5f207ba0d58', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'dabfe21d-4763-436a-8285-c2008f751cea', 'getuplead.com/saas-ppc-agency', 'getuplead com saas ppc agency', 'https://getuplead.com/saas-ppc-agency/', 60, 'pending_review', 'Connect!Row25', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '017b452d-e94d-404a-8bc3-a5f207ba0d58', 100, 1000, 'USD', 'Avg. hourly rate $100 - $149 / hr
Min. project size $1,000+', 60, now());
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('83a8dd3c-9ded-4413-a168-0a5b9ca065e1', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'dabfe21d-4763-436a-8285-c2008f751cea', 'getuplead.com/linkedin-advertising-agency', 'getuplead com linkedin advertising agency', 'https://getuplead.com/linkedin-advertising-agency/', 60, 'pending_review', 'Connect!Row25', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '83a8dd3c-9ded-4413-a168-0a5b9ca065e1', 100, 1000, 'USD', 'Avg. hourly rate $100 - $149 / hr
Min. project size $1,000+', 60, now());
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('9ddc6b30-901a-4fd4-b65a-384c96ce545d', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'dabfe21d-4763-436a-8285-c2008f751cea', 'getuplead.com/google-ads-agency', 'getuplead com google ads agency', 'https://getuplead.com/google-ads-agency/', 60, 'pending_review', 'Connect!Row25', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '9ddc6b30-901a-4fd4-b65a-384c96ce545d', 100, 1000, 'USD', 'Avg. hourly rate $100 - $149 / hr
Min. project size $1,000+', 60, now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'dabfe21d-4763-436a-8285-c2008f751cea', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'dabfe21d-4763-436a-8285-c2008f751cea', '89898124-dec2-44d0-aec2-4a0c9dcdb772', 'adjacent', 60, null, now(), true);

-- Codeless
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('88ceb651-dc68-435a-870c-539303420fda', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Codeless', 'codeless', 'https://codeless.io/', null, null, null, null, 60, 'pending_review', 'Connect!Row26', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '88ceb651-dc68-435a-870c-539303420fda', 'positioning', 'strength', '{"kind":"strength","text":"Transparent, deliverable-based pricing\r\nSEO & Content Plans - Get access to the growth playbooks, frameworks, and strategies with our experienced team of subject-matter experts, writers, strategists, editors, designers, video, and project managers to scale your business."}'::jsonb, 'Transparent, deliverable-based pricing
SEO & Content Plans - Get access to the growth playbooks, frameworks, and strategies with our experienced team of subject-matter experts, writers, strategists, editors, designers, video, and project managers to scale your business.', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('57e8f4b5-9250-485f-94d2-ca834e30cc76', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '88ceb651-dc68-435a-870c-539303420fda', 'codeless.io/services', 'codeless io services', 'https://codeless.io/services/\', 60, 'pending_review', 'Connect!Row26', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '57e8f4b5-9250-485f-94d2-ca834e30cc76', 10000, 20000, 'USD', 'Strategy
$10,000
Premium, long-form content when you’re just starting to grow.
6, 2k-word pieces/month (12k words)
Content-driven SEO strategy
Keyword research
Custom illustration
SERP & content analysis
Secondary research (stats, graphs, etc.)
Plagiarism checks
One round of revisions
Quarterly reporting & analysis

Strategy + Production
$15,000
Best-in-class content to double down on inbound growth.
12, 2k-word pieces/month (24k words)
Brief & draft reviews
Two rounds of revision
Primary research (expert quotes, interviews, etc.)
Writer replacements & rewrites
Bi-monthly status calls
Cost/piece volume discount

Production
$20,000+
Create, build, and recruit a content marketing machine at scale.
20, 2k-word pieces/month (40k words)
Outline & draft reviews
Two rounds of revision
Primary research (expert quotes, interviews, etc.)
Writer replacements & rewrites
Weekly status calls
Cost/piece volume discount', 60, now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '88ceb651-dc68-435a-870c-539303420fda', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '88ceb651-dc68-435a-870c-539303420fda', 'e3ec49d7-1d59-4e74-bfff-44edfd1853b5', 'adjacent', 60, null, now(), true);

-- Llama Lead Gen
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('e67ee8e4-83b2-4a80-b66a-1788ca8a5837', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Llama Lead Gen', 'llama lead gen', 'https://www.llamaleadgen.com/', null, null, null, null, 60, 'pending_review', 'Connect!Row27', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e67ee8e4-83b2-4a80-b66a-1788ca8a5837', 'positioning', 'strength', '{"kind":"strength","text":"Marketing Strategy and Consultation\r\nDeveloping ad copy, creatives, content, and landing pages\r\nCampaign Management and Optimization\r\nEmail Nurture Sequences, CRM, and Marketing Automation\r\nFunnel strategy, media planning, and account audits\r\nPaid Social and Search Campaign Builds and Execution\r\nReporting, analytics, A/B testing, and re-targeting\r\nSEO strategy, audits, and management"}'::jsonb, 'Marketing Strategy and Consultation
Developing ad copy, creatives, content, and landing pages
Campaign Management and Optimization
Email Nurture Sequences, CRM, and Marketing Automation
Funnel strategy, media planning, and account audits
Paid Social and Search Campaign Builds and Execution
Reporting, analytics, A/B testing, and re-targeting
SEO strategy, audits, and management', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('a6874a06-e3e6-4b6d-ada0-9ac66d2fa371', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e67ee8e4-83b2-4a80-b66a-1788ca8a5837', 'www.llamaleadgen.com/agency-services', 'www llamaleadgen com agency services', 'https://www.llamaleadgen.com/agency-services', 60, 'pending_review', 'Connect!Row27', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'a6874a06-e3e6-4b6d-ada0-9ac66d2fa371', 12500, 17500, 'USD', 'Our Omnichannel Marketing Service Plans:

Alpaca - $12,500
Account Audit
Competitive Analysis
Targeting Audience Analysis
Writing Ad Copy
Ads Campaign Builds
Ads Management
Pixel and Tag Setup
A/B Testing and Optimizations
Detailed Reporting & Action Plan

Llama - $15,000
Everything in Alpaca, PLUS:
Media & Content Development Plans
Building Content Calendar
Organic Social Media Marketing Strategy
Developing Ad Creatives
Social Video Production (:06 - :60)

Llama Herd - $17,500
Everything in Llama, PLUS:
Holistic Digital Marketing Strategy
Marketing and Sales Funnel Development
Content Refresh
Crafting Organic Social Posts
Organic Social Media Management
Influencer Marketing & Management', 60, now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e67ee8e4-83b2-4a80-b66a-1788ca8a5837', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e67ee8e4-83b2-4a80-b66a-1788ca8a5837', 'e3ec49d7-1d59-4e74-bfff-44edfd1853b5', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e67ee8e4-83b2-4a80-b66a-1788ca8a5837', '89898124-dec2-44d0-aec2-4a0c9dcdb772', 'adjacent', 60, null, now(), true);
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e67ee8e4-83b2-4a80-b66a-1788ca8a5837', '45cbf116-f0c8-49b7-a379-12e4e632c8b7', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e67ee8e4-83b2-4a80-b66a-1788ca8a5837', '33f512e6-5b2c-4240-9f53-96ea71021c91', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e67ee8e4-83b2-4a80-b66a-1788ca8a5837', '4b4b2b5a-f3b5-4486-9186-9d40db1b7475', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e67ee8e4-83b2-4a80-b66a-1788ca8a5837', '531d6b24-e99c-4cc3-9bd7-064394d3c427', 'unknown', 60, now());

-- Harte Hanks
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('25a042e0-a262-43dc-9412-aa263ca326c8', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Harte Hanks', 'harte hanks', 'https://www.hartehanks.com/', null, null, null, null, 60, 'pending_review', 'Connect!Row28', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '25a042e0-a262-43dc-9412-aa263ca326c8', 'positioning', 'strength', '{"kind":"strength","text":"Global, full-service team works at the intersection of data, MarTech and creativity to tackle our clients’ most difficult marketing challenges. From breakthrough audience definition to high-impact content strategy, we move big-brand-level resources into our clients’ reach, helping them to continually do more with their budget. U.S, UK, Romania and the Philippines"}'::jsonb, 'Global, full-service team works at the intersection of data, MarTech and creativity to tackle our clients’ most difficult marketing challenges. From breakthrough audience definition to high-impact content strategy, we move big-brand-level resources into our clients’ reach, helping them to continually do more with their budget. U.S, UK, Romania and the Philippines', 60, 'import', 'pending');
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '25a042e0-a262-43dc-9412-aa263ca326c8', 'positioning', 'weakness', '{"kind":"weakness","text":"Narrow focus on written content"}'::jsonb, 'Narrow focus on written content', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('b57484b8-649c-491f-8fa4-1b98ac4322ef', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '25a042e0-a262-43dc-9412-aa263ca326c8', 'www.hartehanks.com/marketing', 'www hartehanks com marketing', 'https://www.hartehanks.com/marketing/', 60, 'pending_review', 'Connect!Row28', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '25a042e0-a262-43dc-9412-aa263ca326c8', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, 'Unmapped source tokens: Email', now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '25a042e0-a262-43dc-9412-aa263ca326c8', '89898124-dec2-44d0-aec2-4a0c9dcdb772', 'adjacent', 60, 'Unmapped source tokens: Email', now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '25a042e0-a262-43dc-9412-aa263ca326c8', 'e3ec49d7-1d59-4e74-bfff-44edfd1853b5', 'adjacent', 60, 'Unmapped source tokens: Email', now(), true);
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '25a042e0-a262-43dc-9412-aa263ca326c8', '746de778-bbb8-4d95-8e1f-48f7df4cc191', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '25a042e0-a262-43dc-9412-aa263ca326c8', 'd16441aa-accc-4244-8a8c-89c730be2fe9', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '25a042e0-a262-43dc-9412-aa263ca326c8', '01ed0fd5-3ebb-481c-b519-fd9d2075c30b', 'unknown', 60, now());

-- iSMG
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('671d2ad0-7b43-4de4-a46d-955998235f9f', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'iSMG', 'ismg', 'https://ismg.io/', null, null, null, null, 60, 'pending_review', 'Connect!Row29', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '671d2ad0-7b43-4de4-a46d-955998235f9f', 'positioning', 'strength', '{"kind":"strength","text":"\"Transferred brand value\" - Partnering with ISMG for digital programs and events positions vendors and their brands as thoughtleaders\rand education-providers within the engaged ISMG audience."}'::jsonb, '"Transferred brand value" - Partnering with ISMG for digital programs and events positions vendors and their brands as thoughtleadersand education-providers within the engaged ISMG audience.', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('2ef2e7d4-9e56-4cdf-87f1-f13c90134eae', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '671d2ad0-7b43-4de4-a46d-955998235f9f', 'ismg.io/digital-solutions', 'ismg io digital solutions', 'https://ismg.io/digital-solutions/', 60, 'pending_review', 'Connect!Row29', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '2ef2e7d4-9e56-4cdf-87f1-f13c90134eae', 80, 26500200, 'USD', 'Roundtable Pricing
• In Person Roundtables: $22,500 each
• Virtual Roundtables: $15,500 each
• 3x In Person Roundtables: $20,500 each
• 3x Virtual Roundtables: $14,500 each

RSA Broadcast Alley Video Interview & PDFeBook Transcript + Demand Generation;
100 Guaranteed leads = $26,500200 Guaranteed leads = $33,000

White Paper Lead Generation
1-Touch Content Synd.:Bulk-Buy Lead Tiers: 1-250: $100 CPL | 251-500: $92 CPL | 501-1,000: $85 CPL | 1,001+: $80 CPLABM 1-Touch Content Synd.: $148 CPL2-Touch Content Synd.: $184 CPLABM 2-Touch Content Synd.: $265 CPL*Volume Discounts Available

Custom White Paper & Lead Gen
$28,000 –Whitepaper + 100 Guaranteed Leads$32,000 –Whitepaper + 100 Guaranteed ABM Leads

Custom Webinar
150+ Guaranteed Leads = $23,500200+ Guaranteed Leads = $25,000300+ Guaranteed Leads = $35,500*ABM Options Available

Sponsored interview @ Black Hat - $22,000', 60, now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '671d2ad0-7b43-4de4-a46d-955998235f9f', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '671d2ad0-7b43-4de4-a46d-955998235f9f', '89898124-dec2-44d0-aec2-4a0c9dcdb772', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '671d2ad0-7b43-4de4-a46d-955998235f9f', 'e3ec49d7-1d59-4e74-bfff-44edfd1853b5', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '671d2ad0-7b43-4de4-a46d-955998235f9f', 'c8024d09-09de-474b-91ec-986562143d24', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '671d2ad0-7b43-4de4-a46d-955998235f9f', 'b07777f9-e2ba-4814-a96b-fcf6ef02d1f2', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '671d2ad0-7b43-4de4-a46d-955998235f9f', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '671d2ad0-7b43-4de4-a46d-955998235f9f', '9dbb6a7e-eea4-401d-a07a-86d9c878854f', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '671d2ad0-7b43-4de4-a46d-955998235f9f', 'c5f14c75-2081-4af9-982f-6044e6948e6d', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '671d2ad0-7b43-4de4-a46d-955998235f9f', '1d82e426-5a18-456e-b60d-9141fcc7690c', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '671d2ad0-7b43-4de4-a46d-955998235f9f', 'c2fa35ac-167a-40a9-bc64-cd2fc3dc27e5', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '671d2ad0-7b43-4de4-a46d-955998235f9f', '2874ef33-bf70-46b9-95b8-0ca01f5afeb4', 'unknown', 60, now());

-- LeftLeads
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('63efbebf-6b31-4b48-8e3a-5140e5f78a21', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'LeftLeads', 'leftleads', 'https://leftleads.com/', null, null, null, null, 60, 'pending_review', 'Connect!Row30', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '63efbebf-6b31-4b48-8e3a-5140e5f78a21', 'positioning', 'strength', '{"kind":"strength","text":"outsource tools for data"}'::jsonb, 'outsource tools for data', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('e2465bc3-d06f-4404-8b47-4ecf503e9377', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '63efbebf-6b31-4b48-8e3a-5140e5f78a21', 'leftleads.com/marketing-services', 'leftleads com marketing services', 'https://leftleads.com/marketing-services/', 60, 'pending_review', 'Connect!Row30', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e2465bc3-d06f-4404-8b47-4ecf503e9377', 100, 199999, 'USD', 'Min. project size $1,000+
Avg. hourly rate $100 - $149 / hr
Most Common Project Size $50,000 to $199,999', 60, now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '63efbebf-6b31-4b48-8e3a-5140e5f78a21', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, null, now(), true);
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '63efbebf-6b31-4b48-8e3a-5140e5f78a21', '161928d6-7874-4c57-928d-4c473222ff0d', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '63efbebf-6b31-4b48-8e3a-5140e5f78a21', '05cb2526-aefe-45e9-b54a-a1d5600a03bd', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '63efbebf-6b31-4b48-8e3a-5140e5f78a21', 'c2821a45-1300-4b22-8578-975d6da7cc12', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '63efbebf-6b31-4b48-8e3a-5140e5f78a21', 'c55a97f8-2434-454c-acb4-214065eb8f0e', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '63efbebf-6b31-4b48-8e3a-5140e5f78a21', 'c8b39ef2-ce2e-41b7-a332-25aecb610034', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '63efbebf-6b31-4b48-8e3a-5140e5f78a21', 'cfcfcf4e-0b16-41e7-b435-1cc4fe6654c3', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '63efbebf-6b31-4b48-8e3a-5140e5f78a21', 'a3a56771-02a2-405f-9648-773b393969c8', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '63efbebf-6b31-4b48-8e3a-5140e5f78a21', 'b7f1878b-ca9c-4f80-850a-605cd9a08c89', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '63efbebf-6b31-4b48-8e3a-5140e5f78a21', '8e83aeca-3248-4e78-937e-6719abeb4de0', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '63efbebf-6b31-4b48-8e3a-5140e5f78a21', '0e7133f1-3a22-4b62-9b93-c7fa57c2f325', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '63efbebf-6b31-4b48-8e3a-5140e5f78a21', 'b4513c34-b8f6-4741-848f-8268b9488782', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '63efbebf-6b31-4b48-8e3a-5140e5f78a21', 'ae7192ed-1d7a-41ea-aa23-b754641edfb7', 'unknown', 60, now());

-- Growtika
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('33c1527a-681d-4fb9-b962-2c400526dc35', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Growtika', 'growtika', 'https://growtika.com/', null, null, null, null, 60, 'pending_review', 'Connect!Row31', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '33c1527a-681d-4fb9-b962-2c400526dc35', 'positioning', 'strength', '{"kind":"strength","text":"Our background is in tech, not traditional marketing. So everything we do is imagined from the perspective of your end-user. We know where they hang out. We know what they like - and dislike. We know what they read, what they watch, what they talk about\r\n\r\nGrowtika, a leading Cybersecurity PR agency, offers comprehensive solutions for companies in the cybersecurity industry to enhance their reputation and improve their online presence through expertise in public relations, SEO, and digital marketing. We have helped dozens of cybersecurity companies establish themselves as leaders in their field and build trust with their audience.\r\n\r\nCybersecurity-Focused Public Relations\r\nWe work to shape the perception of your brand and products within the cybersecurity communities you''re targeting through various PR techniques, from crafting compelling press releases to securing media coverage, we aim to establish trust and credibility for your brand. This, in turn, helps to drive organic search growth and increase visibility for your brand in the cybersecurity market.\r\n\r\nPR Strategy\r\nWe work closely with you to develop a comprehensive PR strategy that will increase brand awareness and drive targeted traffic to your website. We can help you build relationships with industry influencers, secure speaking engagements at cybersecurity events and create thought leadership content that positions you as a leading voice in the industry.\r\n\r\nThought Leadership\r\nWe help establish your brand as an authority in the cybersecurity industry by securing organic mentions in reputable publications through our extensive network and PR expertise.\r\n\r\nConference Speaking Opportunities\r\nWe help secure speaking engagements at leading cybersecurity conferences and ensure maximum impact and brand awareness\r\n\r\nCredible Technical Content\r\nOur team of expert cybersecurity writers create well-researched, informative content that speaks to cybersecurity professionals in their own language, staying current with the latest trends in the industry. We ensure our articles are both informative and easily discoverable on search engines by balancing technical accuracy with SEO optimization.\r\n\r\nSEO Optimization\r\nWe provide SEO services that help B2D and B2B companies achieve high search engine rankings for relevant keywords in the cybersecurity industry. Our strategies include competitor analysis, keyword research, technical optimization, on-page optimization, and link building, all tailored to the cybersecurity audience."}'::jsonb, 'Our background is in tech, not traditional marketing. So everything we do is imagined from the perspective of your end-user. We know where they hang out. We know what they like - and dislike. We know what they read, what they watch, what they talk about

Growtika, a leading Cybersecurity PR agency, offers comprehensive solutions for companies in the cybersecurity industry to enhance their reputation and improve their online presence through expertise in public relations, SEO, and digital marketing. We have helped dozens of cybersecurity companies establish themselves as leaders in their field and build trust with their audience.

Cybersecurity-Focused Public Relations
We work to shape the perception of your brand and products within the cybersecurity communities you''re targeting through various PR techniques, from crafting compelling press releases to securing media coverage, we aim to establish trust and credibility for your brand. This, in turn, helps to drive organic search growth and increase visibility for your brand in the cybersecurity market.

PR Strategy
We work closely with you to develop a comprehensive PR strategy that will increase brand awareness and drive targeted traffic to your website. We can help you build relationships with industry influencers, secure speaking engagements at cybersecurity events and create thought leadership content that positions you as a leading voice in the industry.

Thought Leadership
We help establish your brand as an authority in the cybersecurity industry by securing organic mentions in reputable publications through our extensive network and PR expertise.

Conference Speaking Opportunities
We help secure speaking engagements at leading cybersecurity conferences and ensure maximum impact and brand awareness

Credible Technical Content
Our team of expert cybersecurity writers create well-researched, informative content that speaks to cybersecurity professionals in their own language, staying current with the latest trends in the industry. We ensure our articles are both informative and easily discoverable on search engines by balancing technical accuracy with SEO optimization.

SEO Optimization
We provide SEO services that help B2D and B2B companies achieve high search engine rankings for relevant keywords in the cybersecurity industry. Our strategies include competitor analysis, keyword research, technical optimization, on-page optimization, and link building, all tailored to the cybersecurity audience.', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('41b4cdd8-4104-4f6c-bc06-ec04406e3792', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '33c1527a-681d-4fb9-b962-2c400526dc35', 'growtika.com/#services', 'growtika com services', 'https://growtika.com/#services', 60, 'pending_review', 'Connect!Row31', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '41b4cdd8-4104-4f6c-bc06-ec04406e3792', 10000, 49000, 'USD', 'Typical Project Size $10,000 to $49,000', 60, now());
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('9d94de0d-3385-47f4-8061-e755331212fd', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '33c1527a-681d-4fb9-b962-2c400526dc35', 'growtika.com/cybersecurity-pr-agency', 'growtika com cybersecurity pr agency', 'https://growtika.com/cybersecurity-pr-agency/', 60, 'pending_review', 'Connect!Row31', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '9d94de0d-3385-47f4-8061-e755331212fd', 10000, 49000, 'USD', 'Typical Project Size $10,000 to $49,000', 60, now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '33c1527a-681d-4fb9-b962-2c400526dc35', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, null, now(), true);
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '33c1527a-681d-4fb9-b962-2c400526dc35', '7ff8c932-5a1a-447e-aff9-b6a1579bcf7e', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '33c1527a-681d-4fb9-b962-2c400526dc35', 'fa62195b-a99b-4c36-b8f7-043e0299538f', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '33c1527a-681d-4fb9-b962-2c400526dc35', '1285d84e-0202-42ce-90c5-dd278d7d36ce', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '33c1527a-681d-4fb9-b962-2c400526dc35', 'dd28c64d-0590-4b24-9078-2ff219950478', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '33c1527a-681d-4fb9-b962-2c400526dc35', '1c1dd324-72a3-4012-b792-dbbd9fe716a1', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '33c1527a-681d-4fb9-b962-2c400526dc35', '46ef613d-2641-41f2-8496-8aeef70d0fee', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '33c1527a-681d-4fb9-b962-2c400526dc35', 'fae3666d-37e8-49d6-a357-cab7afded01e', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '33c1527a-681d-4fb9-b962-2c400526dc35', '8bbb8f22-9f92-47b1-bda6-61407a4e269b', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '33c1527a-681d-4fb9-b962-2c400526dc35', '194ed601-735e-419a-9aba-1f9b4a7b3ca0', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '33c1527a-681d-4fb9-b962-2c400526dc35', '5b65e3c4-3cff-4383-ba33-c936fa1fe21e', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '33c1527a-681d-4fb9-b962-2c400526dc35', '7408fb07-2e48-4d1d-92cc-28f9565f3f6b', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '33c1527a-681d-4fb9-b962-2c400526dc35', '622584e2-2da7-4ce1-9654-c2034ee4f985', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '33c1527a-681d-4fb9-b962-2c400526dc35', '1a2e7ad5-b167-4def-b31d-c8c7e7e162cf', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '33c1527a-681d-4fb9-b962-2c400526dc35', 'fc9bbade-8746-430e-8599-ce5db88ae160', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '33c1527a-681d-4fb9-b962-2c400526dc35', 'eaacbfd6-e01f-4c20-b26c-9152481f86f4', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '33c1527a-681d-4fb9-b962-2c400526dc35', 'd69e5849-604c-4c39-b82b-ae003c705afc', 'unknown', 60, now());

-- Breach Digital
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('0995a2fc-f330-4f91-acb5-c7de29a66d0c', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Breach Digital', 'breach digital', 'https://www.breachdigital.com/', null, null, null, null, 60, 'pending_review', 'Connect!Row32', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '0995a2fc-f330-4f91-acb5-c7de29a66d0c', 'positioning', 'strength', '{"kind":"strength","text":"Lead Gen for B2B Innovation\r\nBy combining conventional and unconventional means\r\n\r\nBreach Digital is an online B2B marketing agency for tech & software. By combining conventional and unconventional, homegrown digital marketing means, we generate leads and instill brand awareness among the nichest target audiences.\r\n\r\nWe help our clients grow their brand, revenues, and even the team. \r\n\r\n\r\nTargeted Brand Awareness\r\nDelivering content to the eyes of your niche audience\r\n\r\nSocial Media Management\r\nContent production and community development\r\n\r\nPartnerships Generation \r\nQuickly find your next re-sellers & integrators"}'::jsonb, 'Lead Gen for B2B Innovation
By combining conventional and unconventional means

Breach Digital is an online B2B marketing agency for tech & software. By combining conventional and unconventional, homegrown digital marketing means, we generate leads and instill brand awareness among the nichest target audiences.

We help our clients grow their brand, revenues, and even the team. 


Targeted Brand Awareness
Delivering content to the eyes of your niche audience

Social Media Management
Content production and community development

Partnerships Generation 
Quickly find your next re-sellers & integrators', 60, 'import', 'pending');
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '0995a2fc-f330-4f91-acb5-c7de29a66d0c', 'positioning', 'weakness', '{"kind":"weakness","text":"Not a very strong website, focuses on lead-gen and TOFU"}'::jsonb, 'Not a very strong website, focuses on lead-gen and TOFU', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '0995a2fc-f330-4f91-acb5-c7de29a66d0c', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, null, now(), true);
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '0995a2fc-f330-4f91-acb5-c7de29a66d0c', '1b3ffd36-9f21-470a-a8ba-4d57fcbc339b', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '0995a2fc-f330-4f91-acb5-c7de29a66d0c', '813a1ecb-4ff2-4900-9e4d-58a7bad82f1f', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '0995a2fc-f330-4f91-acb5-c7de29a66d0c', '3c62ca0c-cc84-4e46-82eb-2793cfd8c440', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '0995a2fc-f330-4f91-acb5-c7de29a66d0c', 'c49c3f57-f12f-4a98-9458-41f54469e358', 'unknown', 60, now());

-- Ready North
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('1cf5f35d-09ca-4947-b4d2-31a7004cf975', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Ready North', 'ready north', 'https://www.readynorth.com/', null, null, null, null, 60, 'pending_review', 'Connect!Row33', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '1cf5f35d-09ca-4947-b4d2-31a7004cf975', 'positioning', 'strength', '{"kind":"strength","text":"Attract more traffic to your site + Get leads to convert + Measure results fanatically + Iterate continuously = Your recipe for digital marketing ROI."}'::jsonb, 'Attract more traffic to your site + Get leads to convert + Measure results fanatically + Iterate continuously = Your recipe for digital marketing ROI.', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('1daa87e0-de2a-4044-b920-b7863b69b738', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '1cf5f35d-09ca-4947-b4d2-31a7004cf975', 'www.readynorth.com/point-pricing', 'www readynorth com point pricing', 'https://www.readynorth.com/point-pricing', 60, 'pending_review', 'Connect!Row33', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '1daa87e0-de2a-4044-b920-b7863b69b738', 4000, 16500, 'USD', '$4,000 to $16,500 per month depending on growth goals and needs', 60, now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '1cf5f35d-09ca-4947-b4d2-31a7004cf975', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, null, now(), true);
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '1cf5f35d-09ca-4947-b4d2-31a7004cf975', '765fcb41-3473-40ac-9b94-5a37560de95c', 'unknown', 60, now());

-- WebFX
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('ac5390f4-fb26-4b16-a717-5c6fc6490d49', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'WebFX', 'webfx', 'https://www.webfx.com/', null, null, null, null, 60, 'pending_review', 'Connect!Row34; Podcasts!Row5', 'active', now());
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('e473fdb1-1118-4ef3-b2d9-95ee18a7fb8e', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ac5390f4-fb26-4b16-a717-5c6fc6490d49', 'www.webfx.com/digital-advertising', 'www webfx com digital advertising', 'https://www.webfx.com/digital-advertising/services/account-based-marketing/', 60, 'pending_review', 'Connect!Row34', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e473fdb1-1118-4ef3-b2d9-95ee18a7fb8e', 525, 5000, 'USD', 'BASIC PLAN
$525  / month 

check
CURRENT CLIENTS ONLY
check
$850/month ad spend (paid to networks)
check
LinkedIn Account Targeting
check
Up to 100 web lead phone calls tracked
check
Google Ads & LinkedIn Networks
$2,500 INITIAL INVESTMENT 

AGGRESSIVE PLAN
$650  / month 

check
CURRENT CLIENTS ONLY
check
$2,501-$5,000/month ad spend
check
Competitor Intelligence Monitoring
check
LinkedIn Lead Form Ad
check
LinkedIn & Google Ads Networks
$2,800 INITIAL INVESTMENT

CUSTOM DIGITAL MARKETING PLANS
Starting at

$3,000 / month

How we determine pricing
Accounts icon with person icon and writing above it.Discuss your business goals
We’ll learn about what you are hoping to achieve as a company — short- and long-term — to create a digital marketing plan that works toward your goals.

research icon with magnifying glass.Analyze your market
We’ll do a deep dive into your competition — both as a business and within marketing, specifically — to determine the best action plan.

Planning icon with arrow pointing at an x.Review your strategic objectives
What key objectives are on your roadmap? Increase site traffic? Boost your online visibility and brand awareness? We’ll create a plan that aligns perfectly.

INCLUDED IN ALL PLANS:
Expert advice on-demand from a team of over 500 strategists
Data-backed campaign optimizations and improvements
AI-powered strategy recommendations
Closed-loop ROI and customer journey tracking
Access to our in-house revenue acceleration platform, MarketingCloudFX
Nutshell CRM access
Marketing and sales data unification
Monthly campaign measurement, analysis, and revenue reporting
In-depth competitor and industry research
Continuous strategy management and improvement', 60, now());
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('70749389-08d1-4ffd-93e3-91a464e5a8ef', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ac5390f4-fb26-4b16-a717-5c6fc6490d49', 'www.webfx.com/digital-marketing', 'www webfx com digital marketing', 'https://www.webfx.com/digital-marketing/services/', 60, 'pending_review', 'Connect!Row34', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '70749389-08d1-4ffd-93e3-91a464e5a8ef', 525, 5000, 'USD', 'BASIC PLAN
$525  / month 

check
CURRENT CLIENTS ONLY
check
$850/month ad spend (paid to networks)
check
LinkedIn Account Targeting
check
Up to 100 web lead phone calls tracked
check
Google Ads & LinkedIn Networks
$2,500 INITIAL INVESTMENT 

AGGRESSIVE PLAN
$650  / month 

check
CURRENT CLIENTS ONLY
check
$2,501-$5,000/month ad spend
check
Competitor Intelligence Monitoring
check
LinkedIn Lead Form Ad
check
LinkedIn & Google Ads Networks
$2,800 INITIAL INVESTMENT

CUSTOM DIGITAL MARKETING PLANS
Starting at

$3,000 / month

How we determine pricing
Accounts icon with person icon and writing above it.Discuss your business goals
We’ll learn about what you are hoping to achieve as a company — short- and long-term — to create a digital marketing plan that works toward your goals.

research icon with magnifying glass.Analyze your market
We’ll do a deep dive into your competition — both as a business and within marketing, specifically — to determine the best action plan.

Planning icon with arrow pointing at an x.Review your strategic objectives
What key objectives are on your roadmap? Increase site traffic? Boost your online visibility and brand awareness? We’ll create a plan that aligns perfectly.

INCLUDED IN ALL PLANS:
Expert advice on-demand from a team of over 500 strategists
Data-backed campaign optimizations and improvements
AI-powered strategy recommendations
Closed-loop ROI and customer journey tracking
Access to our in-house revenue acceleration platform, MarketingCloudFX
Nutshell CRM access
Marketing and sales data unification
Monthly campaign measurement, analysis, and revenue reporting
In-depth competitor and industry research
Continuous strategy management and improvement', 60, now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ac5390f4-fb26-4b16-a717-5c6fc6490d49', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ac5390f4-fb26-4b16-a717-5c6fc6490d49', '89898124-dec2-44d0-aec2-4a0c9dcdb772', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ac5390f4-fb26-4b16-a717-5c6fc6490d49', 'c658d81e-490d-40f3-b8fc-3df0dd8e5587', 'adjacent', 60, null, now(), true);

-- DarkReading
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('8911e931-c56e-4185-accc-f38bcd5ff299', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'DarkReading', 'darkreading', null, null, null, null, null, 60, 'pending_review', 'Connect!Row35', 'active', now());
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('1cf4cbc5-2f27-4015-b6da-1f3715462b32', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '8911e931-c56e-4185-accc-f38bcd5ff299', 'cyberriskalliancecom.sharepoint.com/:b:', 'cyberriskalliancecom sharepoint com b', 'https://cyberriskalliancecom.sharepoint.com/:b:/s/FileShare/EZ46MgLUxChKt9CTy_wAkaMBB_rVIXirIkstO92pawFUiA?e=FHvYwS', 60, 'pending_review', 'Connect!Row35', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '1cf4cbc5-2f27-4015-b6da-1f3715462b32', 7000, 7000, 'USD', 'Dark Reading’s rate card on contributed articles to their site is $7,000/article before discounts', 60, now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '8911e931-c56e-4185-accc-f38bcd5ff299', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '8911e931-c56e-4185-accc-f38bcd5ff299', 'e3ec49d7-1d59-4e74-bfff-44edfd1853b5', 'adjacent', 60, null, now(), true);

-- TL;DR
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('b411bcd9-c0e2-44d9-bdac-51e2b51241de', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'TL;DR', 'tl dr', 'https://tldr.tech/', null, null, null, null, 60, 'pending_review', 'Connect!Row36', 'active', now());
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('37b7fb14-24e8-49d5-95b9-95128f73b6a6', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b411bcd9-c0e2-44d9-bdac-51e2b51241de', 'tldr.tech/newsletters', 'tldr tech newsletters', 'https://tldr.tech/newsletters', 60, 'pending_review', 'Connect!Row36', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b411bcd9-c0e2-44d9-bdac-51e2b51241de', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b411bcd9-c0e2-44d9-bdac-51e2b51241de', 'e3ec49d7-1d59-4e74-bfff-44edfd1853b5', 'adjacent', 60, null, now(), true);

-- Evanta
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('8e109a0b-f4b2-41bf-b402-1f9829a1eb84', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Evanta', 'evanta', 'https://www.evanta.com/', null, null, null, null, 60, 'pending_review', 'Communities!Row2', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '8e109a0b-f4b2-41bf-b402-1f9829a1eb84', 'positioning', 'strength', '{"kind":"strength","text":"Exclusive communities of C-level executives\r\nEvanta’s powerful network of C-level executives brings together leaders from the world''s leading organizations to connect, share and learn from each other.\r\nWith 36 communities across the globe, serving over 3,600 CISOs, Evanta’s powerful network of security executives brings together CISOs from diverse experiences, backgrounds and industries. Through peer sharing and collaboration, CISOs from the world''s leading organizations drive innovative ideas, exchange best practices and forward-looking perspectives, and address critical issues at the forefront of security today."}'::jsonb, 'Exclusive communities of C-level executives
Evanta’s powerful network of C-level executives brings together leaders from the world''s leading organizations to connect, share and learn from each other.
With 36 communities across the globe, serving over 3,600 CISOs, Evanta’s powerful network of security executives brings together CISOs from diverse experiences, backgrounds and industries. Through peer sharing and collaboration, CISOs from the world''s leading organizations drive innovative ideas, exchange best practices and forward-looking perspectives, and address critical issues at the forefront of security today.', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('e995b19e-cdfc-4fd0-aa48-fa3c77570597', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '8e109a0b-f4b2-41bf-b402-1f9829a1eb84', 'www.evanta.com/ciso', 'www evanta com ciso', 'https://www.evanta.com/ciso', 60, 'pending_review', 'Communities!Row2', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '8e109a0b-f4b2-41bf-b402-1f9829a1eb84', 'f067a804-b0d3-4bbe-8301-11dbb5f85bc5', 'adjacent', 60, null, now(), true);
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '8e109a0b-f4b2-41bf-b402-1f9829a1eb84', 'ec699df8-106e-433c-8a59-9d2045216998', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '8e109a0b-f4b2-41bf-b402-1f9829a1eb84', '74f20b40-5c05-44fd-95a6-21d4b69f0427', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '8e109a0b-f4b2-41bf-b402-1f9829a1eb84', 'd148b75f-54de-4069-8268-ac1ae45477c5', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '8e109a0b-f4b2-41bf-b402-1f9829a1eb84', '53dc1890-076b-45e8-82fd-c5b0b792a150', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '8e109a0b-f4b2-41bf-b402-1f9829a1eb84', '3c90036f-e6b7-4b08-9469-521b82376fa4', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '8e109a0b-f4b2-41bf-b402-1f9829a1eb84', '2654b2f8-f228-4740-bfc4-b837eb8e3329', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '8e109a0b-f4b2-41bf-b402-1f9829a1eb84', 'a2f73dc9-5fa6-4f03-9918-accacc969211', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '8e109a0b-f4b2-41bf-b402-1f9829a1eb84', '0f269284-d184-4a86-82f8-7d7e59e146f6', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '8e109a0b-f4b2-41bf-b402-1f9829a1eb84', 'd95220cc-a7bf-48ba-b612-f5f3270d0b92', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '8e109a0b-f4b2-41bf-b402-1f9829a1eb84', '77a0625f-8135-41a7-a56f-627025f1ecd8', 'unknown', 60, now());

-- CxOInsyte
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('f914b579-5b18-45b8-83d1-b656eac6dfba', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'CxOInsyte', 'cxoinsyte', 'https://cxoinsyte.com/', null, null, null, null, 60, 'pending_review', 'Communities!Row3', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'f914b579-5b18-45b8-83d1-b656eac6dfba', 'positioning', 'strength', '{"kind":"strength","text":"Executive events providing the CxO community with an exclusive forum to network and partner with solution providers\r\n\r\nCISO CxO InSyte events provides unique and exclusive peer-driven cybersecurity networking events showcasing leading operational and enterprise digital cloud and security technologies.\r\n\r\nCxO InSyte Cyber Security MARKET PLACE selects and features the most innovative, trusted and digital transformative products to protect your business and combat the most sophisticated of cyber-attacks"}'::jsonb, 'Executive events providing the CxO community with an exclusive forum to network and partner with solution providers

CISO CxO InSyte events provides unique and exclusive peer-driven cybersecurity networking events showcasing leading operational and enterprise digital cloud and security technologies.

CxO InSyte Cyber Security MARKET PLACE selects and features the most innovative, trusted and digital transformative products to protect your business and combat the most sophisticated of cyber-attacks', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('1a7936c0-68f1-44f1-b792-185f9464bfc4', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'f914b579-5b18-45b8-83d1-b656eac6dfba', 'cxoinsyte.com/ciso-insyte-events', 'cxoinsyte com ciso insyte events', 'https://cxoinsyte.com/ciso-insyte-events', 60, 'pending_review', 'Communities!Row3', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'f914b579-5b18-45b8-83d1-b656eac6dfba', 'f067a804-b0d3-4bbe-8301-11dbb5f85bc5', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'f914b579-5b18-45b8-83d1-b656eac6dfba', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'f914b579-5b18-45b8-83d1-b656eac6dfba', 'b516ce9b-d596-4fc3-a241-3c532f5e1472', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'f914b579-5b18-45b8-83d1-b656eac6dfba', '04632960-3e67-4689-b135-006af49c32e8', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'f914b579-5b18-45b8-83d1-b656eac6dfba', '4f1828fa-a1c5-496f-a8e0-974a2bd72c69', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'f914b579-5b18-45b8-83d1-b656eac6dfba', 'aa5be2ed-20e2-453e-88a0-fbcc96f9689f', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'f914b579-5b18-45b8-83d1-b656eac6dfba', '8db12da1-b0c5-464b-9fab-fac2fa75d202', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'f914b579-5b18-45b8-83d1-b656eac6dfba', '0fb0e11e-6c84-41c9-9d93-189fb21c47d4', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'f914b579-5b18-45b8-83d1-b656eac6dfba', '3465fde3-3861-46af-bf28-5b5813f41313', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'f914b579-5b18-45b8-83d1-b656eac6dfba', '9d9538fc-44db-4e1a-9197-cba4f4a7e488', 'unknown', 60, now());

-- Execweb
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('e6bb60dc-ff29-438c-8cda-29b2af42b708', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Execweb', 'execweb', 'https://www.execweb.com/', null, null, null, null, 60, 'pending_review', 'Communities!Row4', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e6bb60dc-ff29-438c-8cda-29b2af42b708', 'positioning', 'strength', '{"kind":"strength","text":"We facilitate 1:1 virtual sales introductions with CISOs in our network seeking the services of our vetted cybersecurity vendor clients. We enable vetted vendors to have strategic sales conversations with pre-qualified CISOs in our network. Our unique process ensures participants are pre-qualified to add value with each meeting."}'::jsonb, 'We facilitate 1:1 virtual sales introductions with CISOs in our network seeking the services of our vetted cybersecurity vendor clients. We enable vetted vendors to have strategic sales conversations with pre-qualified CISOs in our network. Our unique process ensures participants are pre-qualified to add value with each meeting.', 60, 'import', 'pending');
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e6bb60dc-ff29-438c-8cda-29b2af42b708', 'positioning', 'weakness', '{"kind":"weakness","text":"Lead generation, some ABM, in a canned CISO network."}'::jsonb, 'Lead generation, some ABM, in a canned CISO network.', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('92da103f-1c98-478f-8979-2dfd639ebfad', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e6bb60dc-ff29-438c-8cda-29b2af42b708', 'execweb.networkcom/review-our-ciso-executive-', 'execweb networkcom review our ciso executive', 'https://execweb.networkcom/review-our-ciso-executive-', 60, 'pending_review', 'Communities!Row4', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e6bb60dc-ff29-438c-8cda-29b2af42b708', 'f067a804-b0d3-4bbe-8301-11dbb5f85bc5', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e6bb60dc-ff29-438c-8cda-29b2af42b708', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e6bb60dc-ff29-438c-8cda-29b2af42b708', 'b07777f9-e2ba-4814-a96b-fcf6ef02d1f2', 'adjacent', 60, null, now(), true);
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e6bb60dc-ff29-438c-8cda-29b2af42b708', 'd4e30372-1455-4a63-8d66-725e61c393f5', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e6bb60dc-ff29-438c-8cda-29b2af42b708', 'b70c9c45-9e5c-4479-8922-485fadf951a4', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e6bb60dc-ff29-438c-8cda-29b2af42b708', '94b12e6e-af6e-45d4-9661-6ccfea0c693a', 'unknown', 60, now());

-- CISO XC
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('d84fd346-1fac-45cb-83ed-880265fcb520', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'CISO XC', 'ciso xc', 'https://www.cisoxc.com/', null, null, null, null, 60, 'pending_review', 'Communities!Row5', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'd84fd346-1fac-45cb-83ed-880265fcb520', 'positioning', 'strength', '{"kind":"strength","text":"The Executive Security Conference partners have created CISO XC to bring together Cyber Security Executives and their strategic partners to improve information security.\r\n\r\n​\r\n\r\nOur goal is to build a stronger security community to provide real results. We define community as our peers, vendors, and, of course, the communities where we live. CISO XC will create an environment where attendees come to collaborate, freely exchange ideas, and engage with peers and partners while providing a benefit to a local non-profit that aids the community at large."}'::jsonb, 'The Executive Security Conference partners have created CISO XC to bring together Cyber Security Executives and their strategic partners to improve information security.

​

Our goal is to build a stronger security community to provide real results. We define community as our peers, vendors, and, of course, the communities where we live. CISO XC will create an environment where attendees come to collaborate, freely exchange ideas, and engage with peers and partners while providing a benefit to a local non-profit that aids the community at large.', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'd84fd346-1fac-45cb-83ed-880265fcb520', 'f067a804-b0d3-4bbe-8301-11dbb5f85bc5', 'adjacent', 60, null, now(), true);

-- Gartner Peer Community
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('c6528649-f181-466d-98c7-159f0af313ea', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Gartner Peer Community', 'gartner peer community', 'https://www.gartner.com/peer-community/landing/business-community', null, null, null, null, 60, 'pending_review', 'Communities!Row6; Events!Row3; Events!Row54', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'c6528649-f181-466d-98c7-159f0af313ea', 'positioning', 'strength', '{"kind":"strength","text":"Real-world peer connections, conversations, and actionable advice. Get fast answers on your mission-critical priorities. Over 100,000 members. Ask questions and launch polls to get fast answers from peers in business.\r\n\r\nThe Peer Community is a give-to-get system. Members earn points by participating in Surveys, Q&As and Quick Polls. Your points can be used to post questions (for 100 points) or Quick Polls (for 300 points), and they can also be redeemed for a variety of Peer Community Gift Cards."}'::jsonb, 'Real-world peer connections, conversations, and actionable advice. Get fast answers on your mission-critical priorities. Over 100,000 members. Ask questions and launch polls to get fast answers from peers in business.

The Peer Community is a give-to-get system. Members earn points by participating in Surveys, Q&As and Quick Polls. Your points can be used to post questions (for 100 points) or Quick Polls (for 300 points), and they can also be redeemed for a variety of Peer Community Gift Cards.', 60, 'import', 'pending');
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'c6528649-f181-466d-98c7-159f0af313ea', 'positioning', 'strength', '{"kind":"strength","text":"Gartner-only content\r\n\r\nGartner conferences provide clients and nonclients alike with the management skills and technical knowledge they need to prepare for the future. Through actionable, objective insight from Gartner experts, solutions from experienced providers and peer networking opportunities, you can refine your strategies, reduce risk and get the competitive edge you need to succeed.\r\n\r\n460,000+ curated agendas informed by more than 460,000 client interactions per year\r\n\r\n2,500+ Gartner Research & Advisory experts offering exclusive research and individual consultations on-site\r\n\r\n75,000+ business and technical professionals in attendance globally each year\r\n\r\n1,000+ solution providers at the forefront of technology"}'::jsonb, 'Gartner-only content

Gartner conferences provide clients and nonclients alike with the management skills and technical knowledge they need to prepare for the future. Through actionable, objective insight from Gartner experts, solutions from experienced providers and peer networking opportunities, you can refine your strategies, reduce risk and get the competitive edge you need to succeed.

460,000+ curated agendas informed by more than 460,000 client interactions per year

2,500+ Gartner Research & Advisory experts offering exclusive research and individual consultations on-site

75,000+ business and technical professionals in attendance globally each year

1,000+ solution providers at the forefront of technology', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('59d4bfe6-7626-4b16-8e9d-9a1203f8479c', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'c6528649-f181-466d-98c7-159f0af313ea', 'www.gartner.com/en', 'www gartner com en', 'https://www.gartner.com/en/conferences', 60, 'pending_review', 'Communities!Row6', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '59d4bfe6-7626-4b16-8e9d-9a1203f8479c', 3825, 4525, 'USD', 'Standard price: $4,525
Public-sector price: $3,825
Eligibility for the public-sector price will be verified; proof of public-sector status will be required. Price cannot be applied retroactively. “Public sector” definition: National government, state or local government, public administration.

Make the most of the conference
Accelerate learning and build a shared vision by attending as a group. Receive complimentary registration(s) when you register as a team.*
Group Rate Discount
1 for 3 paid registrations
2 for 5 paid registrations
3 for 7 paid registrations
4 for 10 paid registrations

What is included in the full registration price?

Keynotes
A Gartner expert one-on-one*
Roundtables*
Workshops*
Ask the Expert sessions*
Agenda planning
Exhibit Showcase
The CISO Circle*', 60, now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'c6528649-f181-466d-98c7-159f0af313ea', 'f067a804-b0d3-4bbe-8301-11dbb5f85bc5', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'c6528649-f181-466d-98c7-159f0af313ea', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'c6528649-f181-466d-98c7-159f0af313ea', 'f60c71ad-f801-4c92-aaa8-998d8c3cad58', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'c6528649-f181-466d-98c7-159f0af313ea', '2077c248-d485-4871-aae9-bb7a34080c2c', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'c6528649-f181-466d-98c7-159f0af313ea', 'ebacb92a-e6ff-499d-832e-b580fe05558f', 'unknown', 60, now());

-- Ians
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('1a3c75dc-adc5-4b75-a81f-e2b7b55a345c', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Ians', 'ians', 'https://www.iansresearch.com/', null, null, null, null, 60, 'pending_review', 'Communities!Row7; Events!Row46', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '1a3c75dc-adc5-4b75-a81f-e2b7b55a345c', 'positioning', 'strength', '{"kind":"strength","text":"Closed community of Faculty practitioners and peers.\r\nNo preaching theory or vendor pay-to-play here. Our Faculty help you implement your priorities at speed. You''ll receive unbiased how-to guidance from people that have seen it, done that."}'::jsonb, 'Closed community of Faculty practitioners and peers.
No preaching theory or vendor pay-to-play here. Our Faculty help you implement your priorities at speed. You''ll receive unbiased how-to guidance from people that have seen it, done that.', 60, 'import', 'pending');
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '1a3c75dc-adc5-4b75-a81f-e2b7b55a345c', 'positioning', 'strength', '{"kind":"strength","text":"IANS facilitates and connects clients-to-experts and experts-to-experts. Our Faculty of industry experts provides the breadth and depth of information to guide you on your information security journey. Through a regional delivery model, our events gather all members of the security function."}'::jsonb, 'IANS facilitates and connects clients-to-experts and experts-to-experts. Our Faculty of industry experts provides the breadth and depth of information to guide you on your information security journey. Through a regional delivery model, our events gather all members of the security function.', 60, 'import', 'pending');
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '1a3c75dc-adc5-4b75-a81f-e2b7b55a345c', 'positioning', 'weakness', '{"kind":"weakness","text":"Clients feel locked in"}'::jsonb, 'Clients feel locked in', 60, 'import', 'pending');
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '1a3c75dc-adc5-4b75-a81f-e2b7b55a345c', 'positioning', 'weakness', '{"kind":"weakness","text":"IANS is focused on hand holding and providing data solutions through their analysts. They do offer opportunities to collaborate, but their product focuses on analysts."}'::jsonb, 'IANS is focused on hand holding and providing data solutions through their analysts. They do offer opportunities to collaborate, but their product focuses on analysts.', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('12560f5f-13bf-4b82-b5dd-1104c8f709b5', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '1a3c75dc-adc5-4b75-a81f-e2b7b55a345c', 'www.iansresearch.com/resources', 'www iansresearch com resources', 'https://www.iansresearch.com/resources/infosec-reports-insights', 60, 'pending_review', 'Communities!Row7', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '12560f5f-13bf-4b82-b5dd-1104c8f709b5', 150, 150, 'USD', '$150K yearly', 60, now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '1a3c75dc-adc5-4b75-a81f-e2b7b55a345c', 'f067a804-b0d3-4bbe-8301-11dbb5f85bc5', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '1a3c75dc-adc5-4b75-a81f-e2b7b55a345c', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '1a3c75dc-adc5-4b75-a81f-e2b7b55a345c', 'ddb600c6-14be-44a1-a08b-570975d6d50f', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '1a3c75dc-adc5-4b75-a81f-e2b7b55a345c', 'd88b05fe-b12c-4b3d-bbc2-cad2e0638215', 'unknown', 60, now());

-- SANS
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('77c5684e-7ad5-43fe-9cdd-750fc047988a', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'SANS', 'sans', 'https://www.sans.org/', null, null, null, null, 60, 'pending_review', 'Communities!Row8; Events!Row28; CyberRisk TV!Row8', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '77c5684e-7ad5-43fe-9cdd-750fc047988a', 'positioning', 'strength', '{"kind":"strength","text":"Women''s Pathway\r\nVeterans Pathway\r\nDiversity Pathway\r\nSANS Institute helps organizations mitigate cyber risk by empowering cyber security practitioners and teams with training, certifications, and degrees needed to safeguard organizations and advance careers.\r\n\r\nThe SANS Promise: Everyone who completes SANS training can apply the skills and knowledge they’ve learned the day they return to work."}'::jsonb, 'Women''s Pathway
Veterans Pathway
Diversity Pathway
SANS Institute helps organizations mitigate cyber risk by empowering cyber security practitioners and teams with training, certifications, and degrees needed to safeguard organizations and advance careers.

The SANS Promise: Everyone who completes SANS training can apply the skills and knowledge they’ve learned the day they return to work.', 60, 'import', 'pending');
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '77c5684e-7ad5-43fe-9cdd-750fc047988a', 'positioning', 'weakness', '{"kind":"weakness","text":"Access to real-life CISOs and their insights"}'::jsonb, 'Access to real-life CISOs and their insights', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('716f81d4-7e1e-4d12-afa2-ead1d4c8784b', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '77c5684e-7ad5-43fe-9cdd-750fc047988a', 'www.sans.org/managing-cyber-teams', 'www sans org managing cyber teams', 'https://www.sans.org/managing-cyber-teams/', 60, 'pending_review', 'Communities!Row8', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '716f81d4-7e1e-4d12-afa2-ead1d4c8784b', 6500, 40500, 'USD', 'Tuition for a single course is set at a flat rate of $6,500 USD per course.
Total SANS.edu Program Cost: $40,500 USD', 60, now());
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('f4afd903-fffd-4100-8111-47efb0a043b2', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '77c5684e-7ad5-43fe-9cdd-750fc047988a', 'www.sans.org/managing-cyber-teams', 'www sans org managing cyber teams', 'https://www.sans.org/managing-cyber-teams/?msc=main-nav', 60, 'pending_review', 'Communities!Row8', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'f4afd903-fffd-4100-8111-47efb0a043b2', 6500, 40500, 'USD', 'Tuition for a single course is set at a flat rate of $6,500 USD per course.
Total SANS.edu Program Cost: $40,500 USD', 60, now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '77c5684e-7ad5-43fe-9cdd-750fc047988a', 'f067a804-b0d3-4bbe-8301-11dbb5f85bc5', 'adjacent', 60, 'Unmapped source tokens: professional development', now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '77c5684e-7ad5-43fe-9cdd-750fc047988a', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, 'Unmapped source tokens: professional development', now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '77c5684e-7ad5-43fe-9cdd-750fc047988a', 'ecbcb000-54e3-4a5f-9f10-0ca8acfa1a8d', 'adjacent', 60, 'Unmapped source tokens: professional development', now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '77c5684e-7ad5-43fe-9cdd-750fc047988a', 'b07777f9-e2ba-4814-a96b-fcf6ef02d1f2', 'adjacent', 60, 'Unmapped source tokens: professional development', now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '77c5684e-7ad5-43fe-9cdd-750fc047988a', 'c8024d09-09de-474b-91ec-986562143d24', 'adjacent', 60, 'Unmapped source tokens: professional development', now(), true);
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '77c5684e-7ad5-43fe-9cdd-750fc047988a', '8a575d0a-a584-45a8-a92c-b1329d89c832', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '77c5684e-7ad5-43fe-9cdd-750fc047988a', '2fdaa275-9c2a-4e1a-8ba5-5ed88285ed1f', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '77c5684e-7ad5-43fe-9cdd-750fc047988a', '6126e75a-5077-48c5-a02c-ad557db3a218', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '77c5684e-7ad5-43fe-9cdd-750fc047988a', 'bc1e40e0-34ee-47ee-905b-5b1c403f19db', 'unknown', 60, now());

-- CISO Forum
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('5f5f0068-6f2f-409a-b74a-aaaa4a80736f', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'CISO Forum', 'ciso forum', 'https://www.cisoforum.com/', null, null, null, null, 60, 'pending_review', 'Communities!Row9', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '5f5f0068-6f2f-409a-b74a-aaaa4a80736f', 'positioning', 'strength', '{"kind":"strength","text":"The CISO Forum® is a community-fueled organization designed to foster discussion and facilitate knowledge exchange between enterprise cybersecurity leaders."}'::jsonb, 'The CISO Forum® is a community-fueled organization designed to foster discussion and facilitate knowledge exchange between enterprise cybersecurity leaders.', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '5f5f0068-6f2f-409a-b74a-aaaa4a80736f', 'f067a804-b0d3-4bbe-8301-11dbb5f85bc5', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '5f5f0068-6f2f-409a-b74a-aaaa4a80736f', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Cybersecurity Hub CISO Exchange
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('a3a57818-b856-4e93-91ec-7b4aa8743fa7', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Cybersecurity Hub CISO Exchange', 'cybersecurity hub ciso exchange', 'https://www.cshub.com/events-cybersecurityexchange', null, null, null, null, 60, 'pending_review', 'Communities!Row10', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'a3a57818-b856-4e93-91ec-7b4aa8743fa7', 'f067a804-b0d3-4bbe-8301-11dbb5f85bc5', 'adjacent', 60, null, now(), true);

-- Kyndryl US CISO Expert Exchange
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('71260c5e-5afc-46be-9b6d-5bf29feb8518', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Kyndryl US CISO Expert Exchange', 'kyndryl us ciso expert exchange', 'https://www.kyndryl.com/us/en/about-us/events/ciso-expert-exchange', null, null, null, null, 60, 'pending_review', 'Communities!Row11', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '71260c5e-5afc-46be-9b6d-5bf29feb8518', 'positioning', 'strength', '{"kind":"strength","text":"The Kyndryl US CISO Expert Exchange is an exclusive peer-to-peer community of senior IT leaders and CISOs who gather quarterly for open virtual discussions to share their top-of-mind challenges and gain insights from their peers. Our current members include technology leaders from State Farm, Goldman Sachs, Citizens Financial Group, Caterpillar, Commonwealth of Virgina, Amtrak, Humana, Honda Motor, NextEra Energy, Dow, Kaiser Permanente, MTAHQ, Newell Brands, NYC Department of Transportation, Ahold, WESCO and several others.\r\n\r\nThe topics for the roundtables are determined based on interests and feedback provided during 15-minute prep calls conducted with participants in the weeks leading up to the roundtable.\r\n\r\nHosted by Kyndryl and facilitated by our third-party partner, Profitable Ideas Exchange (PIE), the community provides members a valuable opportunity to build peer relationships, benchmark themselves against peer companies and learn industry best practices."}'::jsonb, 'The Kyndryl US CISO Expert Exchange is an exclusive peer-to-peer community of senior IT leaders and CISOs who gather quarterly for open virtual discussions to share their top-of-mind challenges and gain insights from their peers. Our current members include technology leaders from State Farm, Goldman Sachs, Citizens Financial Group, Caterpillar, Commonwealth of Virgina, Amtrak, Humana, Honda Motor, NextEra Energy, Dow, Kaiser Permanente, MTAHQ, Newell Brands, NYC Department of Transportation, Ahold, WESCO and several others.

The topics for the roundtables are determined based on interests and feedback provided during 15-minute prep calls conducted with participants in the weeks leading up to the roundtable.

Hosted by Kyndryl and facilitated by our third-party partner, Profitable Ideas Exchange (PIE), the community provides members a valuable opportunity to build peer relationships, benchmark themselves against peer companies and learn industry best practices.', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '71260c5e-5afc-46be-9b6d-5bf29feb8518', 'f067a804-b0d3-4bbe-8301-11dbb5f85bc5', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '71260c5e-5afc-46be-9b6d-5bf29feb8518', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- CISO ExecNet
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('42b67f4a-47a7-44b1-9b1e-f1a67d7184ae', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'CISO ExecNet', 'ciso execnet', 'https://cisoexecnet.com/membership', null, null, null, null, 60, 'pending_review', 'Communities!Row12', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '42b67f4a-47a7-44b1-9b1e-f1a67d7184ae', 'positioning', 'strength', '{"kind":"strength","text":"The key benefit to joining CISO ExecNet is the peer-to-peer collaboration, shared learning, and problem-solving that takes place in our intimate half-day breakfast RoundTables. Those gatherings bring members together multiple times a year in Chapter cities across North America. We focus on relevant topics selected in part by our Advisory Council members and current industry trends. \r\n\r\nOur RoundTables follow a standard format:\r\n\r\nNetworking over coffee and breakfast (30 minutes)\r\nIntroductions and general discussion of the topic (45 minutes)\r\nLegal Update from host law firm (10 minutes)\r\nSolution Provider presentations (15-45 mins)\r\nMember closed-door session (30-45 minutes)\r\nConcluding remarks and close (10 minutes)\r\nWe are a membership-driven organization that thrives through engaged members. In addition to our Member Breakfast RoundTables, we offer regular virtual gatherings on critical topics throughout the year., as well as periodic special events and a National Symposium. We issue a regular newsletter to keep Members up-to-date on upcoming gatherings, current industry trends, and other key information. We also have a Members-only LinkedIn Discussion Group for communication, news and sharing of best practices. \r\n\r\nWHY IS THIS NETWORK DIFFERENT?\r\n1. We are a membership organization, not an events company: CISO ExecNet was originally founded as the \"CSO Breakfast Club\" by then vCISO Bill Sieglein in Baltimore. It was intended to enable networking and information-sharing among peers.  Bill was seeking senior level peers with whom he could converse about data security and privacy.  He realized the only way to keep abreast of current developments, both from the bad guys and industry experts, was to learn from his peers.  So, he brought other CISOs together.  CISOs in other cities heard about these breakfast meetings and requested a similar forum.  As a result, new Chapters were added.  Since then, we have continually grown by word of mouth as more CISOs have heard about what we do. \r\n\r\n2. Consistency and Depth: We meet multiple times per year in each Chapter to go deep on a single key topic. Our topics are picked every year by our Advisory Council members, assuring members that we are addressing the most critical and timely topics.\r\n\r\n3. Professional Moderation: Each of our roundtables is professionally moderated by deep cybersecurity subject matter experts. There is a consistency to the tenor and depth of presentation, creating a consistent experience that helps each Chapter strengthen over the years. We work with our Chapter Members to really explore the problems and walk away with real ideas/solutions.\r\n\r\n4. Subject Matter Expert Presentations: Solution Providers send their best executives to share new ideas with the CISO ExecNet Community.  Sponsors  provide an opportunity for Members to keep up-to-date, and learn about new solutions.  Content for each is reviewed thoughtfully to ensure a learning experience for Members at every RoundTable."}'::jsonb, 'The key benefit to joining CISO ExecNet is the peer-to-peer collaboration, shared learning, and problem-solving that takes place in our intimate half-day breakfast RoundTables. Those gatherings bring members together multiple times a year in Chapter cities across North America. We focus on relevant topics selected in part by our Advisory Council members and current industry trends. 

Our RoundTables follow a standard format:

Networking over coffee and breakfast (30 minutes)
Introductions and general discussion of the topic (45 minutes)
Legal Update from host law firm (10 minutes)
Solution Provider presentations (15-45 mins)
Member closed-door session (30-45 minutes)
Concluding remarks and close (10 minutes)
We are a membership-driven organization that thrives through engaged members. In addition to our Member Breakfast RoundTables, we offer regular virtual gatherings on critical topics throughout the year., as well as periodic special events and a National Symposium. We issue a regular newsletter to keep Members up-to-date on upcoming gatherings, current industry trends, and other key information. We also have a Members-only LinkedIn Discussion Group for communication, news and sharing of best practices. 

WHY IS THIS NETWORK DIFFERENT?
1. We are a membership organization, not an events company: CISO ExecNet was originally founded as the "CSO Breakfast Club" by then vCISO Bill Sieglein in Baltimore. It was intended to enable networking and information-sharing among peers.  Bill was seeking senior level peers with whom he could converse about data security and privacy.  He realized the only way to keep abreast of current developments, both from the bad guys and industry experts, was to learn from his peers.  So, he brought other CISOs together.  CISOs in other cities heard about these breakfast meetings and requested a similar forum.  As a result, new Chapters were added.  Since then, we have continually grown by word of mouth as more CISOs have heard about what we do. 

2. Consistency and Depth: We meet multiple times per year in each Chapter to go deep on a single key topic. Our topics are picked every year by our Advisory Council members, assuring members that we are addressing the most critical and timely topics.

3. Professional Moderation: Each of our roundtables is professionally moderated by deep cybersecurity subject matter experts. There is a consistency to the tenor and depth of presentation, creating a consistent experience that helps each Chapter strengthen over the years. We work with our Chapter Members to really explore the problems and walk away with real ideas/solutions.

4. Subject Matter Expert Presentations: Solution Providers send their best executives to share new ideas with the CISO ExecNet Community.  Sponsors  provide an opportunity for Members to keep up-to-date, and learn about new solutions.  Content for each is reviewed thoughtfully to ensure a learning experience for Members at every RoundTable.', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '42b67f4a-47a7-44b1-9b1e-f1a67d7184ae', 'f067a804-b0d3-4bbe-8301-11dbb5f85bc5', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '42b67f4a-47a7-44b1-9b1e-f1a67d7184ae', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- ClubCISO
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('20590cbe-0906-4f37-9b0f-fb4c644a54dc', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ClubCISO', 'clubciso', 'https://www.clubciso.org/membership/', null, null, null, null, 60, 'pending_review', 'Communities!Row13', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '20590cbe-0906-4f37-9b0f-fb4c644a54dc', 'positioning', 'strength', '{"kind":"strength","text":"ClubCISO is a global private members forum powered by Telstra Purple, for information security leaders, working in public and private sector organisations.\r\n\r\nWe are a community of peers, working together to help shape the future of the profession.\r\n\r\nWe are a non-commercial organisation with over 500 members helping to define, support and promote the critical role and value of information security leaders in business and society.\r\n\r\nClubCISO provides a forum in which security leaders can build their network, be involved in proactive discussion, solve problems and create practical guidance that moves the industry forward.\r\n\r\nSample member job titles\r\nCISO / CSO\r\nGlobal Head of Cyber Security\r\nGlobal Privacy Officer\r\nDirector of Security & Enterprise Risk\r\nHead of Business Continuity Risk\r\nSecurity and Compliance Manager\r\nVP Security and Operational Risk"}'::jsonb, 'ClubCISO is a global private members forum powered by Telstra Purple, for information security leaders, working in public and private sector organisations.

We are a community of peers, working together to help shape the future of the profession.

We are a non-commercial organisation with over 500 members helping to define, support and promote the critical role and value of information security leaders in business and society.

ClubCISO provides a forum in which security leaders can build their network, be involved in proactive discussion, solve problems and create practical guidance that moves the industry forward.

Sample member job titles
CISO / CSO
Global Head of Cyber Security
Global Privacy Officer
Director of Security & Enterprise Risk
Head of Business Continuity Risk
Security and Compliance Manager
VP Security and Operational Risk', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '20590cbe-0906-4f37-9b0f-fb4c644a54dc', 'f067a804-b0d3-4bbe-8301-11dbb5f85bc5', 'adjacent', 60, null, now(), true);

-- Elite CISOs
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('dc6fcc98-24d0-4fdd-a554-0bf40b09bf04', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Elite CISOs', 'elite cisos', 'https://www.elitecisos.com/', null, null, null, null, 60, 'pending_review', 'Communities!Row14', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'dc6fcc98-24d0-4fdd-a554-0bf40b09bf04', 'positioning', 'strength', '{"kind":"strength","text":"ELITECISOs is a private member only forum for global information security leaders, working in public and private sector organizations. It’s a community of peer – CISOs and CIOs leading cyber security function in their organizations.\r\n\r\nELITECISOs is a non-commercial entity with over 2500+ members across various cities -Delhi/NCR, Mumbai, Bangalore, Pune, Ahmedabad, Hyderabad, Chennai, Kochi and Dubai etc. The objective of ELITECISOs forum is to bring together cyber security leaders, influence collaboration, share knowledge and explore cyber security solutions that work for the overall improvement of the industry and organization.\r\n\r\nELITECISOs provides a forum in which security leaders can build their network, be involved in proactive discussion, solve problems and create practical guidance that helps everyone involved."}'::jsonb, 'ELITECISOs is a private member only forum for global information security leaders, working in public and private sector organizations. It’s a community of peer – CISOs and CIOs leading cyber security function in their organizations.

ELITECISOs is a non-commercial entity with over 2500+ members across various cities -Delhi/NCR, Mumbai, Bangalore, Pune, Ahmedabad, Hyderabad, Chennai, Kochi and Dubai etc. The objective of ELITECISOs forum is to bring together cyber security leaders, influence collaboration, share knowledge and explore cyber security solutions that work for the overall improvement of the industry and organization.

ELITECISOs provides a forum in which security leaders can build their network, be involved in proactive discussion, solve problems and create practical guidance that helps everyone involved.', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'dc6fcc98-24d0-4fdd-a554-0bf40b09bf04', 'f067a804-b0d3-4bbe-8301-11dbb5f85bc5', 'adjacent', 60, null, now(), true);

-- The CISO Society
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('9c7b7aaa-c0de-4861-98c0-78f296ddcd13', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'The CISO Society', 'the ciso society', 'https://www.thecisosociety.com/', null, null, null, null, 60, 'pending_review', 'Communities!Row15', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '9c7b7aaa-c0de-4861-98c0-78f296ddcd13', 'positioning', 'strength', '{"kind":"strength","text":"The CISO Society is a private community operating under strict Chatham House rules, placing its power in the hands of its members. Through a variety of programs and platforms, members share insights and expertise on security strategy, project roadmaps, technology partners, CISO jobs, talent acquisition, industry news, and much more."}'::jsonb, 'The CISO Society is a private community operating under strict Chatham House rules, placing its power in the hands of its members. Through a variety of programs and platforms, members share insights and expertise on security strategy, project roadmaps, technology partners, CISO jobs, talent acquisition, industry news, and much more.', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '9c7b7aaa-c0de-4861-98c0-78f296ddcd13', 'f067a804-b0d3-4bbe-8301-11dbb5f85bc5', 'adjacent', 60, null, now(), true);

-- Information Systems Security Association
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('07769f88-c635-4869-8dd5-40f2c833c777', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Information Systems Security Association', 'information systems security association', 'https://www.issa.org/membership/join-an-exclusive-community-of-cyber-security-leaders/', null, null, null, null, 60, 'pending_review', 'Communities!Row16', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '07769f88-c635-4869-8dd5-40f2c833c777', 'positioning', 'strength', '{"kind":"strength","text":"Sponsors can reach our members through webinars, events, dedicated emails and digital marketing programs.\r\n\r\nReach a focused core of ISSA Cyber Executive Members through our Cyber Executive Forums."}'::jsonb, 'Sponsors can reach our members through webinars, events, dedicated emails and digital marketing programs.

Reach a focused core of ISSA Cyber Executive Members through our Cyber Executive Forums.', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '07769f88-c635-4869-8dd5-40f2c833c777', 'f067a804-b0d3-4bbe-8301-11dbb5f85bc5', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '07769f88-c635-4869-8dd5-40f2c833c777', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Global CISO Forum
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('d96e51ca-ead1-45cb-b0b1-f0adfb77aad7', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Global CISO Forum', 'global ciso forum', 'https://www.globalcisoforum.com/', null, null, null, null, 60, 'pending_review', 'Communities!Row17', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'd96e51ca-ead1-45cb-b0b1-f0adfb77aad7', 'f067a804-b0d3-4bbe-8301-11dbb5f85bc5', 'adjacent', 60, null, now(), true);

-- CyAlliance
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('3469e86e-f9ca-43de-874b-e3cc11fa60e5', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'CyAlliance', 'cyalliance', 'https://www.cyalliance.com/executivedining', null, null, null, null, 60, 'pending_review', 'Communities!Row18', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '3469e86e-f9ca-43de-874b-e3cc11fa60e5', 'positioning', 'strength', '{"kind":"strength","text":"Executive Networking and Dining Experiences allow the CyAlliance Team to partner with our Alliance Partners, executives, and sales professionals while we provide a distinguished CISO moderator who will lead the interactive conversation.\r\n\r\nDuring our events we will delve into the thoughts of our Executive attendees on what is top of mind, what keep them up at night and more importantly - building a relationship through peer to peer networking while having an AMAZING dinner experience. You and your company will be able to leverage these ideas and thoughts to allow you to focus on your information security strategies and build/grow key relationships."}'::jsonb, 'Executive Networking and Dining Experiences allow the CyAlliance Team to partner with our Alliance Partners, executives, and sales professionals while we provide a distinguished CISO moderator who will lead the interactive conversation.

During our events we will delve into the thoughts of our Executive attendees on what is top of mind, what keep them up at night and more importantly - building a relationship through peer to peer networking while having an AMAZING dinner experience. You and your company will be able to leverage these ideas and thoughts to allow you to focus on your information security strategies and build/grow key relationships.', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '3469e86e-f9ca-43de-874b-e3cc11fa60e5', 'f067a804-b0d3-4bbe-8301-11dbb5f85bc5', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '3469e86e-f9ca-43de-874b-e3cc11fa60e5', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- CXOREvolutionaries
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('def961b3-b53a-4f91-963e-099e4f03d006', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'CXOREvolutionaries', 'cxorevolutionaries', 'https://www.zscaler.com/cxorevolutionaries/events/cxoregionalroundtables/americas', null, null, null, null, 60, 'pending_review', 'Communities!Row19', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'def961b3-b53a-4f91-963e-099e4f03d006', 'f067a804-b0d3-4bbe-8301-11dbb5f85bc5', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'def961b3-b53a-4f91-963e-099e4f03d006', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- HotTopics CISO Community
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('7576f108-f8c0-4409-9dbd-4ff05ce90f84', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'HotTopics CISO Community', 'hottopics ciso community', 'https://hottopics.ht/community/ciso-community', null, null, null, null, 60, 'pending_review', 'Communities!Row20', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '7576f108-f8c0-4409-9dbd-4ff05ce90f84', 'f067a804-b0d3-4bbe-8301-11dbb5f85bc5', 'adjacent', 60, null, now(), true);

-- ProGathers
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('453d8bff-d367-43ba-81b7-8a901b809463', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ProGathers', 'progathers', 'https://www.progathers.com/', null, null, null, null, 60, 'pending_review', 'Communities!Row21', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '453d8bff-d367-43ba-81b7-8a901b809463', 'positioning', 'strength', '{"kind":"strength","text":"Dinner Social - Build lasting relationships with top enterprise executives over fine dining, cocktails and thought-leading discussions.\r\nPrivate Dinner - Fine dining, cocktails & custom roundtable discussion tailored to your specifications - ProGathers has it all when it comes to creating an unforgettable evening for you.\r\nCFO\r\nCIO\r\nCISO"}'::jsonb, 'Dinner Social - Build lasting relationships with top enterprise executives over fine dining, cocktails and thought-leading discussions.
Private Dinner - Fine dining, cocktails & custom roundtable discussion tailored to your specifications - ProGathers has it all when it comes to creating an unforgettable evening for you.
CFO
CIO
CISO', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '453d8bff-d367-43ba-81b7-8a901b809463', 'f067a804-b0d3-4bbe-8301-11dbb5f85bc5', 'adjacent', 60, 'Unmapped source tokens: Communities Events', now(), true);

-- RSA
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('71843b49-cdb0-48fb-bb67-13518a691a9c', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'RSA', 'rsa', 'https://www.rsaconference.com/', null, null, null, null, 60, 'pending_review', 'Events!Row2', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '71843b49-cdb0-48fb-bb67-13518a691a9c', 'positioning', 'strength', '{"kind":"strength","text":"RSA Conference cybersecurity event.  Through RSAC 365 year-round curated content, cybersecurity professionals have resources to support their fight against cyberthreats all year long.\r\n\r\n \r\n\r\nRSAC 365 Cybersecurity Learning\r\n\r\nThrough cutting edge, curated content like webcasts, virtual seminars, and more we’re working every day to provide year-round learning resources to cybersecurity professionals.\r\n\r\nExclusive Webcast Sponsorship\r\nVirtual Seminar Sponsorship\r\nPodcast Sponsorship\r\nNewsletter Sponsorship"}'::jsonb, 'RSA Conference cybersecurity event.  Through RSAC 365 year-round curated content, cybersecurity professionals have resources to support their fight against cyberthreats all year long.

 

RSAC 365 Cybersecurity Learning

Through cutting edge, curated content like webcasts, virtual seminars, and more we’re working every day to provide year-round learning resources to cybersecurity professionals.

Exclusive Webcast Sponsorship
Virtual Seminar Sponsorship
Podcast Sponsorship
Newsletter Sponsorship', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('fe7ec90d-5b27-4c15-910c-7c391d138b39', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '71843b49-cdb0-48fb-bb67-13518a691a9c', 'www.rsaconference.com/about', 'www rsaconference com about', 'https://www.rsaconference.com/about/sponsorship-opportunities', 60, 'pending_review', 'Events!Row2', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '71843b49-cdb0-48fb-bb67-13518a691a9c', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '71843b49-cdb0-48fb-bb67-13518a691a9c', '8c687d5b-a3c1-40b2-94ce-3480b605a267', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '71843b49-cdb0-48fb-bb67-13518a691a9c', 'cf84ea12-a432-49e2-9b3d-bc2274390a7f', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '71843b49-cdb0-48fb-bb67-13518a691a9c', '836c3929-5e1b-4fa7-b5f5-114bf7b59231', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '71843b49-cdb0-48fb-bb67-13518a691a9c', '03c478d0-8e35-444a-adda-a62c11ddcc59', 'unknown', 60, now());

-- Black Hat
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('ac211ac0-e064-4886-8521-bcb653efdf0d', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Black Hat', 'black hat', 'https://www.blackhat.com/', null, null, null, null, 60, 'pending_review', 'Events!Row4; Events!Row40', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ac211ac0-e064-4886-8521-bcb653efdf0d', 'positioning', 'strength', '{"kind":"strength","text":"Black Hat Briefings and Trainings are driven by the needs of the global security community, striving to bring together the best minds in the industry. Black Hat inspires professionals at all career levels, encouraging growth and collaboration among academia, world-class researchers and leaders in the public and private sectors. Today, Black Hat Briefings and Trainings are held annually in the United States, Europe, and Asia, providing premier venues for elite security researchers and trainers to find their audience.\r\n\r\nBlack Hat Trainings offer attendees individual technical courses with topics ranging from the latest in penetration testing, to exploiting web applications, and defending and building SCADA systems. Often designed exclusively for Black Hat, these hands-on attack and defense courses are taught by industry and subject matter experts from all over the world, with the goal of defining and defending tomorrow''s information security landscape."}'::jsonb, 'Black Hat Briefings and Trainings are driven by the needs of the global security community, striving to bring together the best minds in the industry. Black Hat inspires professionals at all career levels, encouraging growth and collaboration among academia, world-class researchers and leaders in the public and private sectors. Today, Black Hat Briefings and Trainings are held annually in the United States, Europe, and Asia, providing premier venues for elite security researchers and trainers to find their audience.

Black Hat Trainings offer attendees individual technical courses with topics ranging from the latest in penetration testing, to exploiting web applications, and defending and building SCADA systems. Often designed exclusively for Black Hat, these hands-on attack and defense courses are taught by industry and subject matter experts from all over the world, with the goal of defining and defending tomorrow''s information security landscape.', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('ddfe7e33-61ea-4695-959f-41ace6e47a98', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ac211ac0-e064-4886-8521-bcb653efdf0d', 'www.blackhat.com/html', 'www blackhat com html', 'https://www.blackhat.com/html/sponsors.html', 60, 'pending_review', 'Events!Row4', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ac211ac0-e064-4886-8521-bcb653efdf0d', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ac211ac0-e064-4886-8521-bcb653efdf0d', 'f067a804-b0d3-4bbe-8301-11dbb5f85bc5', 'adjacent', 60, null, now(), true);
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ac211ac0-e064-4886-8521-bcb653efdf0d', '4605e17d-2d46-49b6-bb6f-1d3b178d36c3', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ac211ac0-e064-4886-8521-bcb653efdf0d', '890c960a-10ad-49bd-a434-fcc2881843d1', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ac211ac0-e064-4886-8521-bcb653efdf0d', 'aa5be2ed-20e2-453e-88a0-fbcc96f9689f', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ac211ac0-e064-4886-8521-bcb653efdf0d', '6de03a20-ae50-425d-a45e-e765a510ba55', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ac211ac0-e064-4886-8521-bcb653efdf0d', '81ae413a-3ebd-411f-843b-3c9cad3facc1', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ac211ac0-e064-4886-8521-bcb653efdf0d', '1e765a86-a52a-40b8-a3fe-4f0c9240fa14', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ac211ac0-e064-4886-8521-bcb653efdf0d', 'b516ce9b-d596-4fc3-a241-3c532f5e1472', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ac211ac0-e064-4886-8521-bcb653efdf0d', 'e3287b9b-3a65-4abd-a99e-79aa06565af7', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ac211ac0-e064-4886-8521-bcb653efdf0d', '4bb7c8e1-9305-47fb-934e-2494acff3bef', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ac211ac0-e064-4886-8521-bcb653efdf0d', '0a1e10dd-bd69-4f7d-9ddb-34d281b3d9b6', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ac211ac0-e064-4886-8521-bcb653efdf0d', '2f4c4a0f-4c2d-458d-b088-06d8dff9f636', 'unknown', 60, now());

-- BSides
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('f9e4b909-8b8a-49b8-a483-3318da91c0d8', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'BSides', 'bsides', 'https://bsides.org/w/page/12194156/FrontPage', null, null, null, null, 60, 'pending_review', 'Events!Row5', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'f9e4b909-8b8a-49b8-a483-3318da91c0d8', 'positioning', 'strength', '{"kind":"strength","text":"Security BSides is the first grass roots, DIY, open security conference in the world — Security BSides is a combination of two event styles: structured anchor events and grass-roots geocentric events.\r\n\r\nBSides does not compete with any other event.  The goal has and always will be to expand the spectrum of conversation and enable a greater variety of events.  Certainly one can take the business perspective and say that any and every security conference competes with each other, but this would ignore the fact that these events are traditionally FREE and simply offer people another alternative to everything else.\r\n\r\nBSides is not the All-Conference-Rejects. Certainly the idea may have sparked after the organizer and others got rejected from a conference submission, but the goal in creating Security BSides is always to enable a greater variety of conversation.  We do not want speakers who are talking about the current big thing, we want to find new talent who are discussing the NEXT BIG THING!"}'::jsonb, 'Security BSides is the first grass roots, DIY, open security conference in the world — Security BSides is a combination of two event styles: structured anchor events and grass-roots geocentric events.

BSides does not compete with any other event.  The goal has and always will be to expand the spectrum of conversation and enable a greater variety of events.  Certainly one can take the business perspective and say that any and every security conference competes with each other, but this would ignore the fact that these events are traditionally FREE and simply offer people another alternative to everything else.

BSides is not the All-Conference-Rejects. Certainly the idea may have sparked after the organizer and others got rejected from a conference submission, but the goal in creating Security BSides is always to enable a greater variety of conversation.  We do not want speakers who are talking about the current big thing, we want to find new talent who are discussing the NEXT BIG THING!', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('4da97f02-36be-491a-90d3-6aeeca0e79e4', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'f9e4b909-8b8a-49b8-a483-3318da91c0d8', 'bsidesnyc.org/assets', 'bsidesnyc org assets', 'https://bsidesnyc.org/assets/BSidesNYC-2024-Sponsorship-Prospectus.pdf', 60, 'pending_review', 'Events!Row5', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4da97f02-36be-491a-90d3-6aeeca0e79e4', 1500, 6000, 'USD', 'Gigabit - $6000
● Social media: BSidesNYC will post on all three channels with the sponsor’s logo and tagging the sponsor, if available.
● Website: The sponsor’s logo will be on the BSidesNYC website.
● Signage: The sponsor’s logo will be on the main overview signage at the event.
● Bag swag participation: Each attendee will receive a bag including their badge and other goods. Sponsors may sendreasonably sized swag to be included in the bag.
● Sponsor Passport: Eligible sponsors will be provided a stamp. Each attendee will have a card to collect stamps fromsponsors. Attendees who received a stamp from each sponsor may enter into a raffle for a prize. BSidesNYC will provide theprize and announce the winner at the end of the conference.
● Table - Atrium
● 4 Sponsor Badges

Megabit - $3000
● Social media: BSidesNYC will post on all three channels with the sponsor’s logo and tagging the sponsor, if available.
● Website: The sponsor’s logo will be on the BSidesNYC website.
● Signage: The sponsor’s logo will be on the main overview signage at the event.
● Bag swag participation: Each attendee will receive a bag including their badge and other goods. Sponsors may sendreasonably sized swag to be included in the bag.
● Sponsor Passport: Eligible sponsors will be provided a stamp. Each attendee will have a card to collect stamps fromsponsors. Attendees who received a stamp from each sponsor may enter into a raffle for a prize. BSidesNYC will provide theprize and announce the winner at the end of the conference.
● Table - Mezzanine
● 2 Sponsor Badges

Kilobit - $1500
● Social media: BSidesNYC will post on all three channels with the sponsor’s logo and tagging the sponsor, if available.
● Website: The sponsor’s logo will be on the BSidesNYC website.
● Signage: The sponsor’s logo will be on the main overview signage at the event.
● Bag swag participation: Each attendee will receive a bag including their badge and other goods. Sponsors may sendreasonably sized swag to be included in the bag.
● Sponsor Passport: Eligible sponsors will be provided a stamp. Each attendee will have a card to collect stamps fromsponsors. Attendees who received a stamp from each sponsor may enter into a raffle for a prize. BSidesNYC will provide theprize and announce the winner at the end of the conference.
● 1 Sponsor Badge


By sponsoring your event, you can put their logo on: the website, t-shirts, podcasts, thank you introductions, signage at the event. 
Custom podcast that you will include in the stream of audio talks for the event
Custom blog post included in the event blog stream
Verbal "thank you" at the beginning of each talk
Lunch or special platform for them to discuss their product/service with your audience
Personal introductions to key people at your event


Each event is run independently and have their own sponsorship opportunities 

BSides events are traditionally FREE to all attendees, although a token fee may be charged by some events to cover fees or help guarantee head counts.

Typically about 100+ people attend the regional events, with these larger events attracting upwards of 500-1600. 

BSides Austin (Coinciding with SxSW / Spring)
BSidesSF (Coinciding with RSAC / Spring)
BSidesLV (Coinciding with Black Hat USA / Summer)
BSidesDC (Autumn)', 60, now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'f9e4b909-8b8a-49b8-a483-3318da91c0d8', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- FutureCon
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('58421d6a-fba4-4e38-ac7a-a36778359503', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'FutureCon', 'futurecon', 'https://futureconevents.com/', null, null, null, null, 60, 'pending_review', 'Events!Row6', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '58421d6a-fba4-4e38-ac7a-a36778359503', 'positioning', 'strength', '{"kind":"strength","text":"FutureCon is a must-attend event that gives your Company an exclusive opportunity to connect with information security leaders across industries, enhancing the networking experience, and as a community, our capabilities to combat cyber-security."}'::jsonb, 'FutureCon is a must-attend event that gives your Company an exclusive opportunity to connect with information security leaders across industries, enhancing the networking experience, and as a community, our capabilities to combat cyber-security.', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('a4c7dd00-695f-455d-bcd0-d38ce5cbf810', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '58421d6a-fba4-4e38-ac7a-a36778359503', 'futureconevents.com/sponsorship', 'futureconevents com sponsorship', 'https://futureconevents.com/sponsorship/', 60, 'pending_review', 'Events!Row6', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'a4c7dd00-695f-455d-bcd0-d38ce5cbf810', 10, 10000, 'USD', 'PREMIER Platinum Sponsor - $10,000
30-minute speaking spot w/ live Q&A – FutureCon CEO intro/outro
First presentation to kick-off the event
C-Level representative option to moderate panel session
Featured guest spot on Kim Hakim’s “And Security for All” Radio Show on LinkedIn Live
Premium logo placement at event and in all online marketing
In-Person booth – 12-foot sponsor table w/ 4 chairs
Virtual Booth w/ live chat – White papers, case studies, videos, demos, etc.
Wi-Fi, light breakfast, lunch, happy hour and badge scanners included
Included add-on sponsorships:
Personalized Event Wi-Fi
Banner signage at event registration table or presentation stand in sessions room​

Platinum Sponsor
30-minute speaking spot w/ live Q&A – FutureCon CEO intro/outro
Early time slot in agenda
Premium logo placement at event and in all online marketing
In-Person booth – 12-foot sponsor table w/ 4 chairs
Virtual Booth w/ live chat – White papers, case studies, videos, demos, etc.
Wi-Fi, light breakfast, lunch, happy hour and badge scanners included
Included add-on sponsorship:
Event lunch sponsorship or event breakfast/coffee sponsorship

Gold Sponsor
30-minute speaking spot w/ live Q&A
Logo placement at event and in all online marketing
In-Person booth – 6-foot sponsor table w/ 2 chairs
sponsorship packages available ranging from $3500 - $10K

Virtual Booth w/ live chat – White papers, case studies, videos, demos, etc.
Wi-Fi, light breakfast, lunch, happy hour and badge scanners included

Silver Sponsor - $3,850
Wi-Fi, light breakfast, lunch, happy hour and badge scanners included
Logo placement at event and in all online marketing
In-Person booth – 6-foot sponsor table w/ 2 chairs
Virtual Booth w/ live chat – White papers, case studies, videos, demos, etc.

VoiceAmerica Radio Show
Exclusive advertising on Kim Hakim’s radio show
“And Security For All”

CISO Bourbon, Breaches and Bots Happy Hour
6-8 Regional CISOs
1-Hour Happy Hour and 30-Minutes Optional Networking – Blind Tasting
Expert Bourbon Presenter – “pops”
Virtual Booth during the main event – Case Studies, videos, white papers, live chat
Pre-registration List and fully scrubbed post event list
Sponsor Q&A w/ CISOs

sponsorship packages available ranging from $3500 - $10K

FutureCon Events

Lead Gen - Hybrid – expect 150 in-person + 150 virtual attendees. Badge scanner included plus contact list post event
Trusted Experience – 25yrs of industry connections and relationships in the Cybersecurity world. Founder/CEO, Kim Hakim, (Former founder/CEO, Data Connectors), Radio/Podcast Host “And Security For All”, Navy Veteran
Thought Leadership – Featuring some of the best thought-provoking presentations by industry security leaders, esteemed keynote speakers and CISO panel discussions.
Discounts you can take advantage of – 3+ events (10% off)', 60, now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '58421d6a-fba4-4e38-ac7a-a36778359503', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '58421d6a-fba4-4e38-ac7a-a36778359503', '9a89702c-a0d3-4317-bf5a-1dc8cb00d276', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '58421d6a-fba4-4e38-ac7a-a36778359503', '3a304ef6-0ec0-41e3-9a5a-aa250d12c67c', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '58421d6a-fba4-4e38-ac7a-a36778359503', '62672917-61f0-403c-90ae-39b2577cbac9', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '58421d6a-fba4-4e38-ac7a-a36778359503', 'fbb1e49e-0cec-4c13-9aea-0c148caebca1', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '58421d6a-fba4-4e38-ac7a-a36778359503', 'a95fba71-29a3-402c-b016-695cbeae26fa', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '58421d6a-fba4-4e38-ac7a-a36778359503', '9f0a58bf-038a-45dd-ac6e-49e11603c90a', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '58421d6a-fba4-4e38-ac7a-a36778359503', '0bdf3e19-885a-42c4-b1c3-778855dfc310', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '58421d6a-fba4-4e38-ac7a-a36778359503', 'cc3488c7-2d6a-43c8-abe8-43a537be7c93', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '58421d6a-fba4-4e38-ac7a-a36778359503', 'a7078a8f-ad41-46bc-9930-183d652d09d1', 'unknown', 60, now());

-- DefCon
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('aab944da-1979-4826-8ce6-15e928ededfa', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'DefCon', 'defcon', 'https://defcon.org/', null, null, null, null, 60, 'pending_review', 'Events!Row7', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'aab944da-1979-4826-8ce6-15e928ededfa', 'positioning', 'strength', '{"kind":"strength","text":"Exhibitors will be able to engage with our attendees in a more traditional format of tables and booths. Exhibitors will also have premium opportunities for community engagement through parties and other events that require evening event space.\r\n\r\nIn addition to a ready-to-go setup, they’ll receive personalized guidance and advice from the DEF CON exhibitors team on how to best engage with the DEF CON community. DEF CON is a unique community that is not always simple to engage with, we are the hacking community at its most grass roots. We strive to represent the individual hacker, researcher, and academic in their most pure, unadulterated form. Our Exhibitor staff is comprised of veteran DEF CON attendees and long-time members of the community who can provide your company with practical advice for engagement with the community, and help your team understand what to expect from our community."}'::jsonb, 'Exhibitors will be able to engage with our attendees in a more traditional format of tables and booths. Exhibitors will also have premium opportunities for community engagement through parties and other events that require evening event space.

In addition to a ready-to-go setup, they’ll receive personalized guidance and advice from the DEF CON exhibitors team on how to best engage with the DEF CON community. DEF CON is a unique community that is not always simple to engage with, we are the hacking community at its most grass roots. We strive to represent the individual hacker, researcher, and academic in their most pure, unadulterated form. Our Exhibitor staff is comprised of veteran DEF CON attendees and long-time members of the community who can provide your company with practical advice for engagement with the community, and help your team understand what to expect from our community.', 60, 'import', 'pending');
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'aab944da-1979-4826-8ce6-15e928ededfa', 'positioning', 'weakness', '{"kind":"weakness","text":"DEF CON does not share any attendee contact information with Vendors or give them access to any private or confidential information. Attendees decide what to reveal about themselves when talking with an exhibitor."}'::jsonb, 'DEF CON does not share any attendee contact information with Vendors or give them access to any private or confidential information. Attendees decide what to reveal about themselves when talking with an exhibitor.', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('e1d1bfaf-a48e-4d15-919e-2f9976f23966', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'aab944da-1979-4826-8ce6-15e928ededfa', 'defcon.org/html', 'defcon org html', 'https://defcon.org/html/defcon-32/dc-32-cfs.html', 60, 'pending_review', 'Events!Row7', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e1d1bfaf-a48e-4d15-919e-2f9976f23966', 5, 2000, 'USD', '$480 USD Online Pre-Reg
$460 USD cash on-site

Parties - Starting at about $500, you’d probably get your image on signage, you may get a special thank you call out during the party, skip the line access, or maybe some other ‘at the party’ benefits. It’s the lowest cost of entry, but don''t underestimate the impact it can have on our community!

Contests - Starting at about $1000, you’d likely get callouts on social media, in closing ceremonies, and maybe logos on shirts or signage (depending on what the contest has). These contests run all weekend and get thousands of eyeballs on them. We have some contests who are mainstays and extremely well known in the community. You’d get some decent advertisement and goodwill amongst the community.

Communities - Starting at about $2000, you’d be helping support sometimes underrepresented demographics, groups who have struggled to find their place in infosec, and also new ideas and events growing under the community banner. Oftentimes these groups are non-profits, so it''s possible that your sponsorship could end up being a tax write off. You’d also likely end up on signage, social media callouts, and likely given time in the community room to get your message out there.

Villages - Starting at about $5k (some villages more), you might be able to get some pretty unique opportunities, like being able to volunteer at the village, you’d likely get logos put on shirts and signage, callouts on social media, and thousands of engaged DEF CON attendees. Just to be up front, you can''t sell things or have a dedicated booth inside of the village, but if your organization wants to get involved in a hands-on teaching experience that involves something important to you (like your people or your products), it’s possible you could work something out with the village leads.', 60, now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'aab944da-1979-4826-8ce6-15e928ededfa', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- SchmooCon
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('e01a8fe9-68d0-4047-85a6-8e0d1ce0ab0d', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'SchmooCon', 'schmoocon', 'https://www.shmoocon.org/', null, null, null, null, 60, 'pending_review', 'Events!Row8', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e01a8fe9-68d0-4047-85a6-8e0d1ce0ab0d', 'positioning', 'strength', '{"kind":"strength","text":"ShmooCon is an annual East coast hacker convention that offers three days of demonstrating technology exploitation, inventive software and hardware solutions, and open discussions of critical InfoSec issues. Four tracks provide our attendees with a rich diversity of information complemented by lively conversation in hotel common spaces late into the night. The conference runs Friday evening through Sunday afternoon and will be held January 12-14, 2024, at the Washington Hilton in Washington D.C.\r\n\r\nShmooCon attendees are a mix of government employees, contractors, security professionals from major industries, information assurance students and faculty, security software and hardware manufacturers, and, of course, hackers. As a group they have high gadget density, a penchant for arguing the esoteric aspects of security problems, and generally like to wear black t-shirts.\r\n\r\nThe conference has sold out each of the seventeen previous years. We are still finalizing numbers for this year, but generally attendance is capped at 2200. This includes around 1700 general attendees, plus speakers, sponsors, members of the press, event representatives, and ShmooCon staff.\r\n\r\n\r\n** Sponsors at the Platinum and Gold levels may purchase additional badges (4 and 2, respectively) at the going conference rate of $175 each, but must tell us this upon application.\r\n\r\n\r\nBe Informed:\r\n\r\nEveryone working your booth will need a badge. Varying numbers of badges are included at each tier of sponsorship.\r\nTables are approximately 6’x3′ and skirted.  Total exhibit space granted to each sponsor is not much larger than this. We are not a big booth venue.  Please plan accordingly so as not to impede upon your neighbors.\r\nSponsors at the Bronze level and above are welcome to offer a single item for inclusion in attendee bags distributed at registration. ShmooCon Organizers must approve items before they are sent to our headquarters.\r\nWe require that all sponsors stay away from any item resembling a ShmooBall (stress ball) for any of their conference handouts."}'::jsonb, 'ShmooCon is an annual East coast hacker convention that offers three days of demonstrating technology exploitation, inventive software and hardware solutions, and open discussions of critical InfoSec issues. Four tracks provide our attendees with a rich diversity of information complemented by lively conversation in hotel common spaces late into the night. The conference runs Friday evening through Sunday afternoon and will be held January 12-14, 2024, at the Washington Hilton in Washington D.C.

ShmooCon attendees are a mix of government employees, contractors, security professionals from major industries, information assurance students and faculty, security software and hardware manufacturers, and, of course, hackers. As a group they have high gadget density, a penchant for arguing the esoteric aspects of security problems, and generally like to wear black t-shirts.

The conference has sold out each of the seventeen previous years. We are still finalizing numbers for this year, but generally attendance is capped at 2200. This includes around 1700 general attendees, plus speakers, sponsors, members of the press, event representatives, and ShmooCon staff.


** Sponsors at the Platinum and Gold levels may purchase additional badges (4 and 2, respectively) at the going conference rate of $175 each, but must tell us this upon application.


Be Informed:

Everyone working your booth will need a badge. Varying numbers of badges are included at each tier of sponsorship.
Tables are approximately 6’x3′ and skirted.  Total exhibit space granted to each sponsor is not much larger than this. We are not a big booth venue.  Please plan accordingly so as not to impede upon your neighbors.
Sponsors at the Bronze level and above are welcome to offer a single item for inclusion in attendee bags distributed at registration. ShmooCon Organizers must approve items before they are sent to our headquarters.
We require that all sponsors stay away from any item resembling a ShmooBall (stress ball) for any of their conference handouts.', 60, 'import', 'pending');
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e01a8fe9-68d0-4047-85a6-8e0d1ce0ab0d', 'positioning', 'weakness', '{"kind":"weakness","text":"ShmooCon attendees expect a certain level of anonymity.\r\n\r\nTherefore, we do not collect demographics on our attendees nor do we provide any specific data we might have to outside parties. We estimate that 35% percent of our attendees come from the greater metropolitan Washington, D.C. area, including Baltimore and Northern Virginia. Other participants hail primarily from across the United States, Canada, and Europe."}'::jsonb, 'ShmooCon attendees expect a certain level of anonymity.

Therefore, we do not collect demographics on our attendees nor do we provide any specific data we might have to outside parties. We estimate that 35% percent of our attendees come from the greater metropolitan Washington, D.C. area, including Baltimore and Northern Virginia. Other participants hail primarily from across the United States, Canada, and Europe.', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('7f43627e-631b-421e-9bc2-c37425927eff', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e01a8fe9-68d0-4047-85a6-8e0d1ce0ab0d', 'www.shmoocon.org/sponsors', 'www shmoocon org sponsors', 'https://www.shmoocon.org/sponsors/', 60, 'pending_review', 'Events!Row8', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '7f43627e-631b-421e-9bc2-c37425927eff', 500, 15000, 'USD', 'Platinum - $15,000
10 badges
Option to purchase 4 additional tickets
Item in attendee bag
Full page ad plus logo in conference program
Logo on conference website
Prominent logo in registration banner
Prominent logo on conference podiums
Exhibit table in key traffic location

Gold - $10,000
6 badges
Option to purchase 2 additional tickets
Item in attendee bag
Half page ad plus logo in conference program
Logo on conference website
Logo in registration banner
Logo on conference podiums
Exhibit table in high traffic location

Silver - $6,000
4 badges
Item in attendee bag
Logo in conference program
Logo on conference website
Exhibit table

No_Table - $4,500
4 badges
Item in attendee bag
Logo in conference program
Logo on conference website

Bronze - $3000
2 badges
Item in attendee bag
Logo in conference program
Logo on conference website
Exhibit table

Friendship - $500
1 badge
Logo in conference program
Logo on conference website', 60, now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e01a8fe9-68d0-4047-85a6-8e0d1ce0ab0d', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e01a8fe9-68d0-4047-85a6-8e0d1ce0ab0d', '8d8f24e9-44b9-4610-8133-35273e9e53b4', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e01a8fe9-68d0-4047-85a6-8e0d1ce0ab0d', 'f1fbc76f-789a-40f0-b8f5-b9998075c5e9', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e01a8fe9-68d0-4047-85a6-8e0d1ce0ab0d', 'e11948dd-cb9f-4a55-aa9b-fbcdb7b40a3d', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e01a8fe9-68d0-4047-85a6-8e0d1ce0ab0d', '60c4cdd3-eabb-4919-878c-b4719276764c', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e01a8fe9-68d0-4047-85a6-8e0d1ce0ab0d', '1c22e6ed-f19c-4020-844b-a5c4b87acf2a', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e01a8fe9-68d0-4047-85a6-8e0d1ce0ab0d', 'cf84ea12-a432-49e2-9b3d-bc2274390a7f', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e01a8fe9-68d0-4047-85a6-8e0d1ce0ab0d', '0acf73c1-8b03-4953-a79c-d52db33cf2ff', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e01a8fe9-68d0-4047-85a6-8e0d1ce0ab0d', '9c860525-89c8-4723-983b-b54d1a7a75c0', 'unknown', 60, now());

-- SecureWorld
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('a0b51295-857a-434c-96bc-f018bdf09174', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'SecureWorld', 'secureworld', 'https://www.secureworld.io/', null, null, null, null, 60, 'pending_review', 'Events!Row9', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'a0b51295-857a-434c-96bc-f018bdf09174', 'positioning', 'strength', '{"kind":"strength","text":"For 22 years, SecureWorld has addressed global IT security issues and shared critical knowledge and tools needed to protect against ever-evolving threats. Through our network of industry experts, thought leaders, practitioners, and solution providers, we collaborate to produce leading-edge, relevant content. We host in-person regional conferences across North America, virtual conferences and eSummits, and frequent educational webcasts, and publish original news and analysis of the InfoSec world.\r\n\r\n\r\nSecureWorld provides sponsors with multiple avenues to deliver brand visibility, thought leadership, and strong demand generation. Among the many ways of engaging with our audience of InfoSec professionals:\r\n\r\n»  15 in-person, regional conferences\r\n»  16 executive roundtable dinners\r\n»  8 virtual conferences\r\n»  Digital media programming: webinars, newsletters, and more"}'::jsonb, 'For 22 years, SecureWorld has addressed global IT security issues and shared critical knowledge and tools needed to protect against ever-evolving threats. Through our network of industry experts, thought leaders, practitioners, and solution providers, we collaborate to produce leading-edge, relevant content. We host in-person regional conferences across North America, virtual conferences and eSummits, and frequent educational webcasts, and publish original news and analysis of the InfoSec world.


SecureWorld provides sponsors with multiple avenues to deliver brand visibility, thought leadership, and strong demand generation. Among the many ways of engaging with our audience of InfoSec professionals:

»  15 in-person, regional conferences
»  16 executive roundtable dinners
»  8 virtual conferences
»  Digital media programming: webinars, newsletters, and more', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'a0b51295-857a-434c-96bc-f018bdf09174', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Data Connectors
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('00ddfd02-4a77-4e05-aa59-9bf68f7d7a9e', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Data Connectors', 'data connectors', 'https://dataconnectors.com/events', null, null, null, null, 60, 'pending_review', 'Events!Row10', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '00ddfd02-4a77-4e05-aa59-9bf68f7d7a9e', 'positioning', 'strength', '{"kind":"strength","text":"650,000 Executive Members Across North America\r\nFor more than 20 years, Data Connectors has facilitated the collaboration between cybersecurity professionals and solution providers. Through our Virtual Summits, Web Briefings, in-person conferences, networking, and other community events, cybersecurity professionals enjoy informative education from industry luminaries, innovative solution providers, and government agencies.\r\n\r\nCybersecurity Focus Areas\r\nApplication & Cloud Security\r\nData Backup, Classification & Recovery\r\nEducation, Security Awareness & Pen Testing\r\nEmail Security\r\nEndpoint Security & Protection\r\nIdentity & Access Management (IAM)\r\nManaged Detection and Response (MDR)\r\nSecurity Orchestration, Automation, and Response (SOAR)"}'::jsonb, '650,000 Executive Members Across North America
For more than 20 years, Data Connectors has facilitated the collaboration between cybersecurity professionals and solution providers. Through our Virtual Summits, Web Briefings, in-person conferences, networking, and other community events, cybersecurity professionals enjoy informative education from industry luminaries, innovative solution providers, and government agencies.

Cybersecurity Focus Areas
Application & Cloud Security
Data Backup, Classification & Recovery
Education, Security Awareness & Pen Testing
Email Security
Endpoint Security & Protection
Identity & Access Management (IAM)
Managed Detection and Response (MDR)
Security Orchestration, Automation, and Response (SOAR)', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '00ddfd02-4a77-4e05-aa59-9bf68f7d7a9e', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Cyber Security & Cloud Congress North America 2024
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('b66091ca-48bd-4cf8-92fe-37f3d074a092', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Cyber Security & Cloud Congress North America 2024', 'cyber security and cloud congress north america 2024', 'https://www.cybersecuritycloudexpo.com/northamerica/', null, null, null, null, 60, 'pending_review', 'Events!Row11', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b66091ca-48bd-4cf8-92fe-37f3d074a092', 'positioning', 'strength', '{"kind":"strength","text":"Zero Trust, Threat Detection & Response, Training, Talent & Culture, Cyber Security Landscape, Identity & Access Management, Application Security, Hybrid Cloud strategies, Cloud Adoption, Cloud Transformation, Data Security, Disaster Recovery Strategies, Smart Cloud Security, and many more."}'::jsonb, 'Zero Trust, Threat Detection & Response, Training, Talent & Culture, Cyber Security Landscape, Identity & Access Management, Application Security, Hybrid Cloud strategies, Cloud Adoption, Cloud Transformation, Data Security, Disaster Recovery Strategies, Smart Cloud Security, and many more.', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b66091ca-48bd-4cf8-92fe-37f3d074a092', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- National Cyber Summit
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('11de954e-c05a-4789-95a2-50850f6d320c', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'National Cyber Summit', 'national cyber summit', 'https://www.nationalcybersummit.com/', null, null, null, null, 60, 'pending_review', 'Events!Row12', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '11de954e-c05a-4789-95a2-50850f6d320c', 'positioning', 'strength', '{"kind":"strength","text":"National Cyber Summit is the nation’s most innovative cyber security-technology event, offering unique educational, collaborative and workforce development opportunities for industry visionaries and rising leaders. NCS offers more value than similar cyber conferences with diverse focus-areas, premier speakers, and unmatched accessibility. Our core focus is on three things: education, collaboration and innovation."}'::jsonb, 'National Cyber Summit is the nation’s most innovative cyber security-technology event, offering unique educational, collaborative and workforce development opportunities for industry visionaries and rising leaders. NCS offers more value than similar cyber conferences with diverse focus-areas, premier speakers, and unmatched accessibility. Our core focus is on three things: education, collaboration and innovation.', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '11de954e-c05a-4789-95a2-50850f6d320c', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Cybersecurity Summt
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('30bd812a-597d-4616-8184-b1556c37605a', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Cybersecurity Summt', 'cybersecurity summt', 'https://www.cybersecuritysummit.org/', null, null, null, null, 60, 'pending_review', 'Events!Row13', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '30bd812a-597d-4616-8184-b1556c37605a', 'positioning', 'strength', '{"kind":"strength","text":"Today’s technology and the related threat landscape are changing at warp speed, making it hard to anticipate tomorrow. Quantum computing and generative AI promise both good and bad outcomes: even as lives are saved and cold cases solved, these tools generate deepfake deception and bolster bad bias. The cybersecurity community protects people, processes, and property, and to combat outdated measures and tools, we must do it faster. We know we are strongest when we work together to leverage our collective strengths. For the 14th annual Cyber Security Summit, we come to the table ready to tackle emerging challenges and those beyond the horizon."}'::jsonb, 'Today’s technology and the related threat landscape are changing at warp speed, making it hard to anticipate tomorrow. Quantum computing and generative AI promise both good and bad outcomes: even as lives are saved and cold cases solved, these tools generate deepfake deception and bolster bad bias. The cybersecurity community protects people, processes, and property, and to combat outdated measures and tools, we must do it faster. We know we are strongest when we work together to leverage our collective strengths. For the 14th annual Cyber Security Summit, we come to the table ready to tackle emerging challenges and those beyond the horizon.', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '30bd812a-597d-4616-8184-b1556c37605a', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- CyberSat
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('3a993fa9-64f9-4699-aa6c-7da05626db24', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'CyberSat', 'cybersat', 'https://www.cybersatsummit.com/', null, null, null, null, 60, 'pending_review', 'Events!Row14', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '3a993fa9-64f9-4699-aa6c-7da05626db24', 'positioning', 'strength', '{"kind":"strength","text":"CyberSat is the only space security event that successfully unites satellite, space, cyber, and government to educate on threat vectors and to thwart next-generation attacks.\r\n\r\nSince 2017, CyberSat has been at the forefront of the satellite industry’s burgeoning cybersecurity landscape. By bringing together satellite, space, and cybersecurity experts alongside government and military leaders, CyberSat has become a must-attend for cybersecurity discussions. We continuously adapt to stay aligned with industry changes, embracing new end-user markets, applications, and technologies. We’re committed to being your partner when it comes to finding new customers as a sponsor of CyberSat 2024."}'::jsonb, 'CyberSat is the only space security event that successfully unites satellite, space, cyber, and government to educate on threat vectors and to thwart next-generation attacks.

Since 2017, CyberSat has been at the forefront of the satellite industry’s burgeoning cybersecurity landscape. By bringing together satellite, space, and cybersecurity experts alongside government and military leaders, CyberSat has become a must-attend for cybersecurity discussions. We continuously adapt to stay aligned with industry changes, embracing new end-user markets, applications, and technologies. We’re committed to being your partner when it comes to finding new customers as a sponsor of CyberSat 2024.', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '3a993fa9-64f9-4699-aa6c-7da05626db24', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Blue Team Con
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('c8c21a26-490c-4444-850e-eb0eaaf9c7d3', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Blue Team Con', 'blue team con', 'https://blueteamcon.com/', null, null, null, null, 60, 'pending_review', 'Events!Row15', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'c8c21a26-490c-4444-850e-eb0eaaf9c7d3', 'positioning', 'strength', '{"kind":"strength","text":"Blue Team Con is the only annual in-person conference created for cybersecurity defenders, inclusive of anyone interested in safeguarding organizations.\r\n\r\nJoin more than 750 community-minded defensive cybersecurity experts for information sharing, relationship and career building events, and defense-focused talks held by some of the industry’s leading cybersecurity minds.\r\n\r\nEarn CPE credits in every one of our Trainings and Talks – 20+ CPEs available in 3 days!"}'::jsonb, 'Blue Team Con is the only annual in-person conference created for cybersecurity defenders, inclusive of anyone interested in safeguarding organizations.

Join more than 750 community-minded defensive cybersecurity experts for information sharing, relationship and career building events, and defense-focused talks held by some of the industry’s leading cybersecurity minds.

Earn CPE credits in every one of our Trainings and Talks – 20+ CPEs available in 3 days!', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'c8c21a26-490c-4444-850e-eb0eaaf9c7d3', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- (ISC)² Security Congress
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('a1bc69ef-e929-4031-b801-79d35c46ebe2', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '(ISC)² Security Congress', 'isc security congress', 'https://web.cvent.com/event/a5c15481-492d-4efa-bd79-a521ab73b699/websitePage:26a84091-6c86-411e-9e16-6613ec20a219', null, null, null, null, 60, 'pending_review', 'Events!Row16; Events!Row51', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'a1bc69ef-e929-4031-b801-79d35c46ebe2', 'positioning', 'strength', '{"kind":"strength","text":"The Security World Congress conference is a three-day event offering CPE credit opportunities, career guidance and educational sessions."}'::jsonb, 'The Security World Congress conference is a three-day event offering CPE credit opportunities, career guidance and educational sessions.', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'a1bc69ef-e929-4031-b801-79d35c46ebe2', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Kodi Connect
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('33a8728d-4e73-44c3-9239-91a0b6cbf307', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Kodi Connect', 'kodi connect', 'https://www.kodiconnect.com/event/', null, null, null, null, 60, 'pending_review', 'Events!Row17', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '33a8728d-4e73-44c3-9239-91a0b6cbf307', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '33a8728d-4e73-44c3-9239-91a0b6cbf307', 'eb41b08e-7b62-4025-8fd5-1a0231a611f4', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '33a8728d-4e73-44c3-9239-91a0b6cbf307', '81553af5-02df-4dbd-8e8d-e63821aadc3d', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '33a8728d-4e73-44c3-9239-91a0b6cbf307', '10e7832b-fd81-4856-8354-245ffcae0876', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '33a8728d-4e73-44c3-9239-91a0b6cbf307', '3d666aba-7b3c-42f7-a773-1875916739ce', 'unknown', 60, now());

-- CSO Conference & Awards
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('4359baf4-7a96-4b64-abce-9e497a3f414a', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'CSO Conference & Awards', 'cso conference and awards', 'https://event.foundryco.com/cso-conference-awards/', null, null, null, null, 60, 'pending_review', 'Events!Row18', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4359baf4-7a96-4b64-abce-9e497a3f414a', 'positioning', 'strength', '{"kind":"strength","text":"CSO Conference + Awards is anchored by world-class content from CSO media and IDC research. Become a sponsor to engage with top-tier security leaders through immersive sessions, panels, digital post programs, and lightning insights. This elite event platform offers sponsors tailor-made visibility in front of an influential audience poised for cutting-edge defense strategies. These security leaders are among the most accomplished in their fields—and eager to evaluate new security solutions to extend their innovation."}'::jsonb, 'CSO Conference + Awards is anchored by world-class content from CSO media and IDC research. Become a sponsor to engage with top-tier security leaders through immersive sessions, panels, digital post programs, and lightning insights. This elite event platform offers sponsors tailor-made visibility in front of an influential audience poised for cutting-edge defense strategies. These security leaders are among the most accomplished in their fields—and eager to evaluate new security solutions to extend their innovation.', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4359baf4-7a96-4b64-abce-9e497a3f414a', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, 'Unmapped source tokens: National Event', now(), true);

-- CDM Media
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('86bf6745-ae01-49d4-af3f-d2f8007770fc', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'CDM Media', 'cdm media', 'https://www.cdmmedia.com/dinners', null, null, null, null, 60, 'pending_review', 'Events!Row20', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '86bf6745-ae01-49d4-af3f-d2f8007770fc', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Apex Assembly
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('d943b3f4-c759-4aa2-9f94-0f90a0fa3591', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Apex Assembly', 'apex assembly', 'https://apexassembly.com/', null, null, null, null, 60, 'pending_review', 'Events!Row21', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'd943b3f4-c759-4aa2-9f94-0f90a0fa3591', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'd943b3f4-c759-4aa2-9f94-0f90a0fa3591', 'f067a804-b0d3-4bbe-8301-11dbb5f85bc5', 'adjacent', 60, null, now(), true);

-- Data Cloud Summit
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('e7b5b436-2267-435b-ab3e-81b11662274f', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Data Cloud Summit', 'data cloud summit', 'https://www.snowflake.com/summit/', null, null, null, null, 60, 'pending_review', 'Events!Row22; Events!Row23', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e7b5b436-2267-435b-ab3e-81b11662274f', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- CIO Synergy
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('d4e816d1-c9fe-4e71-a4b3-49abfd13c4fa', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'CIO Synergy', 'cio synergy', 'https://info.ciosynergy.com/ciodinners/', null, null, null, null, 60, 'pending_review', 'Events!Row24', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'd4e816d1-c9fe-4e71-a4b3-49abfd13c4fa', 'positioning', 'strength', '{"kind":"strength","text":"CIOdinners empower global CIO & IT leaders through thought leading, informative and engaging collaboration over dinner\r\n\r\nCIOdinners collaborate  CIO''s & IT leaders through invite-only dinners that center around moderated exchange. Attended by the biggest brands and enterprises  CIOdinners allow leaders to collaborate on current issues and benchmark paths while engaging on lasting relationships with the Who''s Who of IT."}'::jsonb, 'CIOdinners empower global CIO & IT leaders through thought leading, informative and engaging collaboration over dinner

CIOdinners collaborate  CIO''s & IT leaders through invite-only dinners that center around moderated exchange. Attended by the biggest brands and enterprises  CIOdinners allow leaders to collaborate on current issues and benchmark paths while engaging on lasting relationships with the Who''s Who of IT.', 60, 'import', 'pending');
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'd4e816d1-c9fe-4e71-a4b3-49abfd13c4fa', 'positioning', 'weakness', '{"kind":"weakness","text":"Tesla, Starbucks, Samsung, Aon, Pfizer, Google, Humana, Walmart"}'::jsonb, 'Tesla, Starbucks, Samsung, Aon, Pfizer, Google, Humana, Walmart', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'd4e816d1-c9fe-4e71-a4b3-49abfd13c4fa', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- CXO Sync
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('90ff4a01-427d-4e06-a279-67a6404465a6', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'CXO Sync', 'cxo sync', 'https://cxosync.com/events', null, null, null, null, 60, 'pending_review', 'Events!Row25', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '90ff4a01-427d-4e06-a279-67a6404465a6', 'positioning', 'strength', '{"kind":"strength","text":"Live and virtual events to gather CXOs from the world''s largest corporations and brands. From our global conferences, private dinners and virtual events; CXOs gather to discuss, debate and challenge issues and strategies - a brain-trust built on thought-leading content"}'::jsonb, 'Live and virtual events to gather CXOs from the world''s largest corporations and brands. From our global conferences, private dinners and virtual events; CXOs gather to discuss, debate and challenge issues and strategies - a brain-trust built on thought-leading content', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '90ff4a01-427d-4e06-a279-67a6404465a6', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- DarkTrace
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('94651814-ff9d-41cb-b3b4-f5922967ef34', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'DarkTrace', 'darktrace', 'https://darktrace.com/', null, null, null, null, 60, 'pending_review', 'Events!Row26', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '94651814-ff9d-41cb-b3b4-f5922967ef34', 'positioning', 'strength', '{"kind":"strength","text":"understand the reality versus the hype surrounding AI and how to achieve cyber resilience.\r\nAdversaries are taking advantage of automation and AI to create sophisticated new threats in rapid time.\r\nConversely, vendor promises of AI as the panacea to mitigate these threats can be confusing at best. As the leading Cyber AI vendor, Darktrace has a decade of success helping customers mitigate risk by using AI, by preparing security teams before an attack occurs and speeding up investigations and containment to stop an attack becoming a breach.\r\n\r\nLearn new innovations to shift from a reactive detection and response-only posture to the latest in proactive cyber defense – to stay steps ahead of adversaries.\r\nGain the AI knowledge you need to navigate the cyber security landscape and distinguish AI vendor technology from AI marketing, and learn how AI is used by adversaries.\r\nHear from your industry peers and Darktrace experts on AI use cases, and understand how a platform approach is your best defense against an uncertain future of AI generated attacks."}'::jsonb, 'understand the reality versus the hype surrounding AI and how to achieve cyber resilience.
Adversaries are taking advantage of automation and AI to create sophisticated new threats in rapid time.
Conversely, vendor promises of AI as the panacea to mitigate these threats can be confusing at best. As the leading Cyber AI vendor, Darktrace has a decade of success helping customers mitigate risk by using AI, by preparing security teams before an attack occurs and speeding up investigations and containment to stop an attack becoming a breach.

Learn new innovations to shift from a reactive detection and response-only posture to the latest in proactive cyber defense – to stay steps ahead of adversaries.
Gain the AI knowledge you need to navigate the cyber security landscape and distinguish AI vendor technology from AI marketing, and learn how AI is used by adversaries.
Hear from your industry peers and Darktrace experts on AI use cases, and understand how a platform approach is your best defense against an uncertain future of AI generated attacks.', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '94651814-ff9d-41cb-b3b4-f5922967ef34', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Chrysalis
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('f29af211-3b09-409b-bcdf-f8d421e0a1a9', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Chrysalis', 'chrysalis', 'https://techvisionresearch.com/chrysalis-iv/', null, null, null, null, 60, 'pending_review', 'Events!Row27', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'f29af211-3b09-409b-bcdf-f8d421e0a1a9', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- IAPP
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('bd93611c-6fbf-4a94-bae4-c3d3f9681eb8', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'IAPP', 'iapp', null, null, null, null, null, 60, 'pending_review', 'Events!Row29', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'bd93611c-6fbf-4a94-bae4-c3d3f9681eb8', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- CSA
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('ca4fd6e0-8dd4-48f5-8cdc-ba590e61264a', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'CSA', 'csa', null, null, null, null, null, 60, 'pending_review', 'Events!Row30', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ca4fd6e0-8dd4-48f5-8cdc-ba590e61264a', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- HIMMS
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('08212d04-5736-4ce2-a168-55e1ecff61aa', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'HIMMS', 'himms', null, null, null, null, null, 60, 'pending_review', 'Events!Row31', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '08212d04-5736-4ce2-a168-55e1ecff61aa', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- ISACA
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('01393dfd-a230-4fc8-8f89-11845a1d036b', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ISACA', 'isaca', null, null, null, null, null, 60, 'pending_review', 'Events!Row32', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '01393dfd-a230-4fc8-8f89-11845a1d036b', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- ISC2 (1 day events focused on AI and Diversity)
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('4b630002-9bc3-467a-bfd9-c8171a112089', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ISC2 (1 day events focused on AI and Diversity)', 'isc2 1 day events focused on ai and diversity', null, null, null, null, null, 60, 'pending_review', 'Events!Row33', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4b630002-9bc3-467a-bfd9-c8171a112089', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- WiCyS
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('e99b25cf-cbfd-4b51-87c0-5fbdbc7e0c0b', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'WiCyS', 'wicys', null, null, null, null, null, 60, 'pending_review', 'Events!Row34', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e99b25cf-cbfd-4b51-87c0-5fbdbc7e0c0b', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- EWS (Executive Women's Forum)
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('8e8c0b9a-01e8-4382-b5da-eed6880a3480', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'EWS (Executive Women''s Forum)', 'ews executive women s forum', null, null, null, null, null, 60, 'pending_review', 'Events!Row35', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '8e8c0b9a-01e8-4382-b5da-eed6880a3480', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Global Security Exchange (ASIS conference)
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('5ff7e1c4-9d79-4548-8269-1d6b9a0cb679', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Global Security Exchange (ASIS conference)', 'global security exchange asis conference', 'https://www.gsx.org/', null, null, null, null, 60, 'pending_review', 'Events!Row36', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '5ff7e1c4-9d79-4548-8269-1d6b9a0cb679', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Infosecurity London (Reed Expo show in June)
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('cc706d4a-80da-459e-af8a-5a8a7be82aeb', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Infosecurity London (Reed Expo show in June)', 'infosecurity london reed expo show in june', 'https://www.infosecurityeurope.com/', null, null, null, null, 60, 'pending_review', 'Events!Row37', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'cc706d4a-80da-459e-af8a-5a8a7be82aeb', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Wild West Hacking Fest
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('fe357c2c-7a0c-45f4-a6f6-842313e16c38', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Wild West Hacking Fest', 'wild west hacking fest', 'https://wildwesthackinfest.com/', null, null, null, null, 60, 'pending_review', 'Events!Row38', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'fe357c2c-7a0c-45f4-a6f6-842313e16c38', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Aspen Institute
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('486d4deb-c300-491f-bd3f-8abc9603c5c7', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Aspen Institute', 'aspen institute', 'https://www.aspeninstitute.org/', null, null, null, null, 60, 'pending_review', 'Events!Row39', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '486d4deb-c300-491f-bd3f-8abc9603c5c7', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- OWASP
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('863ff58d-dccd-4b91-9ab6-b8925b6d2445', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'OWASP', 'owasp', 'https://owasp.org/events/', null, null, null, null, 60, 'pending_review', 'Events!Row41', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '863ff58d-dccd-4b91-9ab6-b8925b6d2445', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Technosecurity/Digital Forensics (East and West)
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('641eb4c9-86ab-4bf6-8b11-690f840c47c6', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Technosecurity/Digital Forensics (East and West)', 'technosecurity digital forensics east and west', 'https://www.technosecurity.us/east', null, null, null, null, 60, 'pending_review', 'Events!Row42', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '641eb4c9-86ab-4bf6-8b11-690f840c47c6', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- SECtember.ai (CSA event focusing on AI in early September)
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('001a009a-acab-4ace-9ead-0ee9ce303542', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'SECtember.ai (CSA event focusing on AI in early September)', 'sectember ai csa event focusing on ai in early september', null, null, null, null, null, 60, 'pending_review', 'Events!Row43', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '001a009a-acab-4ace-9ead-0ee9ce303542', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- ElevateIT
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('c896d179-1162-4799-b6bb-925b59fdfaba', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ElevateIT', 'elevateit', 'https://eitevents.com/', null, null, null, null, 60, 'pending_review', 'Events!Row44', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'c896d179-1162-4799-b6bb-925b59fdfaba', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Cyber Executive Forums (ISSA run - 4x year)
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('0722e787-b58f-4e8e-aab4-8151a00d8818', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Cyber Executive Forums (ISSA run - 4x year)', 'cyber executive forums issa run 4x year', 'https://www.members.issa.org/', null, null, null, null, 60, 'pending_review', 'Events!Row45', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '0722e787-b58f-4e8e-aab4-8151a00d8818', 'positioning', 'strength', '{"kind":"strength","text":"Reasons companies choose to support ISSA:\r\n\r\nReach a highly qualified engaged audience of cyber security professionals. Let ISSA help you connect with your target market, generate new leads, share thought leadership, syndicate content, and position your organization as an industry leader.\r\n60% of members come from companies with more than 1,000 employees\r\nWeb marketing programs reach all 11,000 active members around the world and Industry webinars reach an additional 16,000 prospective members\r\n53% of members have an annual IS budget of more than $5 Million\r\n60% of members are CISSP Certified\r\nWe have sponsorship packages for every budget. We can also work with you to customize a package tailored to meet your specific goals and support your marketing strategy."}'::jsonb, 'Reasons companies choose to support ISSA:

Reach a highly qualified engaged audience of cyber security professionals. Let ISSA help you connect with your target market, generate new leads, share thought leadership, syndicate content, and position your organization as an industry leader.
60% of members come from companies with more than 1,000 employees
Web marketing programs reach all 11,000 active members around the world and Industry webinars reach an additional 16,000 prospective members
53% of members have an annual IS budget of more than $5 Million
60% of members are CISSP Certified
We have sponsorship packages for every budget. We can also work with you to customize a package tailored to meet your specific goals and support your marketing strategy.', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '0722e787-b58f-4e8e-aab4-8151a00d8818', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Splunk .conf24
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('bdf9d973-80fd-4a6a-ade4-e0965cab3a84', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Splunk .conf24', 'splunk conf24', 'https://conf.splunk.com/', null, null, null, null, 60, 'pending_review', 'Events!Row47', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'bdf9d973-80fd-4a6a-ade4-e0965cab3a84', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- AWS re:Inforce (AWS on cloud sec)
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('d5da9e28-75fd-4af1-9d8a-fa7d9eb0d36c', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'AWS re:Inforce (AWS on cloud sec)', 'aws re inforce aws on cloud sec', 'https://reinforce.awsevents.com/', null, null, null, null, 60, 'pending_review', 'Events!Row48', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'd5da9e28-75fd-4af1-9d8a-fa7d9eb0d36c', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Crowdstrike Fal.con
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('f48e77fd-ee30-42e1-93cd-2a515d227ba0', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Crowdstrike Fal.con', 'crowdstrike fal con', 'https://www.crowdstrike.com/events/fal-con/las-vegas/', null, null, null, null, 60, 'pending_review', 'Events!Row49', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'f48e77fd-ee30-42e1-93cd-2a515d227ba0', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- NICE
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('a2d15bc9-5e06-44fa-ad0d-8c598a985c48', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'NICE', 'nice', 'https://niceconference.org/', null, null, null, null, 60, 'pending_review', 'Events!Row50', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'a2d15bc9-5e06-44fa-ad0d-8c598a985c48', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Billington
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('c9b3c7a2-a425-4486-bc7a-d7df73fb50b9', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Billington', 'billington', 'https://billingtoncybersecurity.com/15th-annual-billington-cybersecurity-summit/', null, null, null, null, 60, 'pending_review', 'Events!Row52', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'c9b3c7a2-a425-4486-bc7a-d7df73fb50b9', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- IEEE Symposium on Security and Privacy
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('62e2b8b8-3eb9-4acc-aba3-46c2ec87aee1', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'IEEE Symposium on Security and Privacy', 'ieee symposium on security and privacy', 'https://www.ieee-security.org/TC/SP2024/', null, null, null, null, 60, 'pending_review', 'Events!Row53', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '62e2b8b8-3eb9-4acc-aba3-46c2ec87aee1', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- SIA GovSummit
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('a7ae3b8c-f40b-48ef-9182-e77a99530a8b', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'SIA GovSummit', 'sia govsummit', 'https://govsummit.securityindustry.org/', null, null, null, null, 60, 'pending_review', 'Events!Row55', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'a7ae3b8c-f40b-48ef-9182-e77a99530a8b', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Forrester Security & Risk
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('0b9dc249-2fe8-4c00-b0e9-0d95427df6a2', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Forrester Security & Risk', 'forrester security and risk', 'https://www.forrester.com/event/security-risk/', null, null, null, null, 60, 'pending_review', 'Events!Row56', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '0b9dc249-2fe8-4c00-b0e9-0d95427df6a2', 'positioning', 'strength', '{"kind":"strength","text":"Access unbiased Forrester research, tools, and methodologies to further your security and risk expertise with an eye toward accelerating business growth. Seize the opportunity to leverage the ever-evolving world of AI, cloud, and data to speed successful outcomes with objective insights.\r\n\r\nSpeakers: Our keynote speakers, carefully selected for their trailblazing expertise, will ignite your entrepreneurial spirit and challenge your paradigm of what’s possible.\r\n\r\nAnalysts: Meet with Forrester’s analysts to align your security strategies with reality. Get your questions answered and stay informed on the latest developments.\r\n\r\nAgenda: Build new skills in a robust agenda with 30+ sessions, workshops, keynotes, case studies, and specialized tracks to aid in targeted learning.\r\n\r\nMarketplace: Evaluate innovative solutions among security providers who offer best-in-class products to help you build trust and secure your organization."}'::jsonb, 'Access unbiased Forrester research, tools, and methodologies to further your security and risk expertise with an eye toward accelerating business growth. Seize the opportunity to leverage the ever-evolving world of AI, cloud, and data to speed successful outcomes with objective insights.

Speakers: Our keynote speakers, carefully selected for their trailblazing expertise, will ignite your entrepreneurial spirit and challenge your paradigm of what’s possible.

Analysts: Meet with Forrester’s analysts to align your security strategies with reality. Get your questions answered and stay informed on the latest developments.

Agenda: Build new skills in a robust agenda with 30+ sessions, workshops, keynotes, case studies, and specialized tracks to aid in targeted learning.

Marketplace: Evaluate innovative solutions among security providers who offer best-in-class products to help you build trust and secure your organization.', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '0b9dc249-2fe8-4c00-b0e9-0d95427df6a2', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Identity Week
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('7d373505-a1d1-4311-b03a-0ad12def9b05', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Identity Week', 'identity week', 'https://identityweek.net/', null, null, null, null, 60, 'pending_review', 'Events!Row57', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '7d373505-a1d1-4311-b03a-0ad12def9b05', 'positioning', 'strength', '{"kind":"strength","text":"We bring together stakeholders across all disciplines and sectors to dialogue, create insight and promote collaboration and innovation.\r\n\r\nIdentity Week promotes:\r\n\r\nNew and creative solutions\r\nCutting edge innovation\r\nNew business models\r\nWorld-leading technologies and solutions\r\n• European, U.S. and Asia centric news around: technology advances, regulation, integration with other vendor solutions and application across multiple sectors including Travel, Finance and Banking, Government and the Public Sector."}'::jsonb, 'We bring together stakeholders across all disciplines and sectors to dialogue, create insight and promote collaboration and innovation.

Identity Week promotes:

New and creative solutions
Cutting edge innovation
New business models
World-leading technologies and solutions
• European, U.S. and Asia centric news around: technology advances, regulation, integration with other vendor solutions and application across multiple sectors including Travel, Finance and Banking, Government and the Public Sector.', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '7d373505-a1d1-4311-b03a-0ad12def9b05', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- FedID
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('b231099f-eb8a-4987-8740-f6956e1bf6ee', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'FedID', 'fedid', 'https://events.afcea.org/FedID23/Public/enter.aspx', null, null, null, null, 60, 'pending_review', 'Events!Row58', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b231099f-eb8a-4987-8740-f6956e1bf6ee', 'positioning', 'strength', '{"kind":"strength","text":"Since 1995, FedID has stood as the U.S. federal government''s primary forum for outreach and collaboration within the global identity community. Joining forces with AFCEA''s TechNet Cyber, which attracts over 5,000 cybersecurity professionals worldwide, this event will facilitate discussions led by U.S. Cyber Command, DISA, the DoD CIO, and various industry and academia partners.\r\n\r\nThese two independently developed and hosted conferences will unfold simultaneously and in the same venue. While FedID sessions will have a dedicated space, offering the familiar engagement opportunities, participants will also have the privilege of attending selected TechNet Cyber conference sessions and exploring the exhibit hall as part of their FedID registration package. Seize this unique opportunity to be part of two significant world-class events, both happening in the same place at the same time. Don''t miss out!"}'::jsonb, 'Since 1995, FedID has stood as the U.S. federal government''s primary forum for outreach and collaboration within the global identity community. Joining forces with AFCEA''s TechNet Cyber, which attracts over 5,000 cybersecurity professionals worldwide, this event will facilitate discussions led by U.S. Cyber Command, DISA, the DoD CIO, and various industry and academia partners.

These two independently developed and hosted conferences will unfold simultaneously and in the same venue. While FedID sessions will have a dedicated space, offering the familiar engagement opportunities, participants will also have the privilege of attending selected TechNet Cyber conference sessions and exploring the exhibit hall as part of their FedID registration package. Seize this unique opportunity to be part of two significant world-class events, both happening in the same place at the same time. Don''t miss out!', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b231099f-eb8a-4987-8740-f6956e1bf6ee', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- EIC
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('778fa4fb-07d5-453f-81ae-912e7eb71668', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'EIC', 'eic', 'https://kuppingercole.com/events/eic2024', null, null, null, null, 60, 'pending_review', 'Events!Row59', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '778fa4fb-07d5-453f-81ae-912e7eb71668', 'positioning', 'strength', '{"kind":"strength","text":"Europe´s prime conference on Digital ID, Security, Privacy and Governance in an AI-driven world. EIC offers unparalleled networking opportunities with a great community and visionary leaders as well as deep dive sessions unravelling the very tech shaping our tomorrow."}'::jsonb, 'Europe´s prime conference on Digital ID, Security, Privacy and Governance in an AI-driven world. EIC offers unparalleled networking opportunities with a great community and visionary leaders as well as deep dive sessions unravelling the very tech shaping our tomorrow.', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '778fa4fb-07d5-453f-81ae-912e7eb71668', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Techvision
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('65d7c70b-9051-434a-9c05-5b6dbee9801b', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Techvision', 'techvision', 'https://techvision.global/', null, null, null, null, 60, 'pending_review', 'Events!Row60', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '65d7c70b-9051-434a-9c05-5b6dbee9801b', 'positioning', 'strength', '{"kind":"strength","text":"TechVision’s Promise\r\n\r\nto Protect\r\nYour intellectual property rights are paramount. To make sure your ideas stay yours, we sign a strict NDA from day one to secure your exclusive ownership of the codebase and other deliverables.\r\n\r\nto Pioneer\r\nYour need for innovation is our motivation. We are a world-class team of developers, designers, and business consultants passionate about innovation and technology advancement. We will guide you through any obstacles, roadblocks and uncharted territory.\r\n\r\nto Prove Value\r\nEngineering your vision into value is our top priority. Whether your goal is to gain cost efficiency or grow revenue, we guide you to the highest possible value by positioning you for rapid, scalable success."}'::jsonb, 'TechVision’s Promise

to Protect
Your intellectual property rights are paramount. To make sure your ideas stay yours, we sign a strict NDA from day one to secure your exclusive ownership of the codebase and other deliverables.

to Pioneer
Your need for innovation is our motivation. We are a world-class team of developers, designers, and business consultants passionate about innovation and technology advancement. We will guide you through any obstacles, roadblocks and uncharted territory.

to Prove Value
Engineering your vision into value is our top priority. Whether your goal is to gain cost efficiency or grow revenue, we guide you to the highest possible value by positioning you for rapid, scalable success.', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '65d7c70b-9051-434a-9c05-5b6dbee9801b', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Future Identity Festival
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('3bddbe31-2331-4dfa-aa3b-b0831674ec29', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Future Identity Festival', 'future identity festival', 'https://thefutureidentity.com/', null, null, null, null, 60, 'pending_review', 'Events!Row61', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '3bddbe31-2331-4dfa-aa3b-b0831674ec29', 'positioning', 'strength', '{"kind":"strength","text":"At Future Identity we explore the latest initiatives, technologies and concepts powering the growth of digital identity. Get ready for unique content and experiences, uniting the policymakers, solutions providers, enterprises and leading associations building our future identity ecosystem."}'::jsonb, 'At Future Identity we explore the latest initiatives, technologies and concepts powering the growth of digital identity. Get ready for unique content and experiences, uniting the policymakers, solutions providers, enterprises and leading associations building our future identity ecosystem.', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '3bddbe31-2331-4dfa-aa3b-b0831674ec29', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Security Summit
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('4bbef78c-37c6-444d-a1f4-fd66f43928d6', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Security Summit', 'security summit', 'https://www.securitysummits.com/', null, null, null, null, 60, 'pending_review', 'Events!Row62', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4bbef78c-37c6-444d-a1f4-fd66f43928d6', 'positioning', 'strength', '{"kind":"strength","text":"SecurityWeek’s Security Summit events are a series of topic-specific virtual conferences that allow attendees from around the world to immerse in a virtual world to discuss the latest cybersecurity trends and gain insights into security strategies and emerging cyber threats faced by businesses."}'::jsonb, 'SecurityWeek’s Security Summit events are a series of topic-specific virtual conferences that allow attendees from around the world to immerse in a virtual world to discuss the latest cybersecurity trends and gain insights into security strategies and emerging cyber threats faced by businesses.', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4bbef78c-37c6-444d-a1f4-fd66f43928d6', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Chrysalis (virtual), 16-17 January
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('506c632e-48bb-4b59-b190-7f0847365d0a', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Chrysalis (virtual), 16-17 January', 'chrysalis virtual 16 17 january', null, null, null, null, null, 60, 'pending_review', 'Events!Row63', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '506c632e-48bb-4b59-b190-7f0847365d0a', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- OpenID Summit Tokyo 2024 (Tokyo, Japan), 19 January
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('5935f4dd-f59c-497c-a0be-e00ff7443f91', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'OpenID Summit Tokyo 2024 (Tokyo, Japan), 19 January', 'openid summit tokyo 2024 tokyo japan 19 january', null, null, null, null, null, 60, 'pending_review', 'Events!Row64', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '5935f4dd-f59c-497c-a0be-e00ff7443f91', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Trust and Internet Identity Meeting Europe (TIIME; Research & Education) (Copenhagen, DK), 30 January - 1 February
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('bed3bd00-b0ed-4d4b-8f0b-78481526389f', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Trust and Internet Identity Meeting Europe (TIIME; Research & Education) (Copenhagen, DK), 30 January - 1 February', 'trust and internet identity meeting europe tiime research and education copenhagen dk 30 january 1 february', null, null, null, null, null, 60, 'pending_review', 'Events!Row65', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'bed3bd00-b0ed-4d4b-8f0b-78481526389f', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Gartner Identity & Access Management Summit (London, UK), 4-5 March
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('ca9d3ba6-e8f9-42b5-aff7-1aadf9099806', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Gartner Identity & Access Management Summit (London, UK), 4-5 March', 'gartner identity and access management summit london uk 4 5 march', null, null, null, null, null, 60, 'pending_review', 'Events!Row66', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ca9d3ba6-e8f9-42b5-aff7-1aadf9099806', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Internet2 Community Exchange (Chicago, US), 4-7 March
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('237a3978-c5d3-4ce9-8c18-4500abe10326', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Internet2 Community Exchange (Chicago, US), 4-7 March', 'internet2 community exchange chicago us 4 7 march', null, null, null, null, null, 60, 'pending_review', 'Events!Row67', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '237a3978-c5d3-4ce9-8c18-4500abe10326', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- IETF 119 (Brisbane, AU), 16-22 March {Standards Development}
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('b496430f-5f66-40b1-81af-61500d838420', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'IETF 119 (Brisbane, AU), 16-22 March {Standards Development}', 'ietf 119 brisbane au 16 22 march standards development', null, null, null, null, null, 60, 'pending_review', 'Events!Row68', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b496430f-5f66-40b1-81af-61500d838420', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- IAPP Global Privacy Summit (Washington, DC, US), 1-4 April
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('2169680e-7eb0-41bc-9b65-e3436f5b0127', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'IAPP Global Privacy Summit (Washington, DC, US), 1-4 April', 'iapp global privacy summit washington dc us 1 4 april', null, null, null, null, null, 60, 'pending_review', 'Events!Row69', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '2169680e-7eb0-41bc-9b65-e3436f5b0127', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- IAM Tech Day (Sao Paulo, BR), 10 April
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('4dbca3da-374b-4958-8251-d76080f1ac29', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'IAM Tech Day (Sao Paulo, BR), 10 April', 'iam tech day sao paulo br 10 april', null, null, null, null, null, 60, 'pending_review', 'Events!Row70', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4dbca3da-374b-4958-8251-d76080f1ac29', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- OAuth Security Workshop (Rome, IT), 10-12 April {Standards Development}
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('4fcf1225-b2e2-411d-9c73-4d9e20b2f172', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'OAuth Security Workshop (Rome, IT), 10-12 April {Standards Development}', 'oauth security workshop rome it 10 12 april standards development', null, null, null, null, null, 60, 'pending_review', 'Events!Row71', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4fcf1225-b2e2-411d-9c73-4d9e20b2f172', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- IIW XXXVIII Spring 2024 (Mountain View, US), 16-18 April {Standards Development}
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('7e1dad8a-b5f9-4b03-b701-b2c20515426d', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'IIW XXXVIII Spring 2024 (Mountain View, US), 16-18 April {Standards Development}', 'iiw xxxviii spring 2024 mountain view us 16 18 april standards development', null, null, null, null, null, 60, 'pending_review', 'Events!Row72', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '7e1dad8a-b5f9-4b03-b701-b2c20515426d', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- RSA Conference (San Francisco, US), 6-9 May
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('441e1c74-2bae-44f0-9fe8-e63ceb4ca5d1', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'RSA Conference (San Francisco, US), 6-9 May', 'rsa conference san francisco us 6 9 may', null, null, null, null, null, 60, 'pending_review', 'Events!Row73', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '441e1c74-2bae-44f0-9fe8-e63ceb4ca5d1', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- IDM Nordics (Stockholm, SE), 8 May
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('d50db675-4084-49a9-9197-b11a06a235a0', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'IDM Nordics (Stockholm, SE), 8 May', 'idm nordics stockholm se 8 may', null, null, null, null, null, 60, 'pending_review', 'Events!Row74', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'd50db675-4084-49a9-9197-b11a06a235a0', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- ID4Africa (Cape Town, South Africa), 21-24 May
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('7927b95f-c153-42c2-8890-426ed77e881c', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ID4Africa (Cape Town, South Africa), 21-24 May', 'id4africa cape town south africa 21 24 may', null, null, null, null, null, 60, 'pending_review', 'Events!Row75', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '7927b95f-c153-42c2-8890-426ed77e881c', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Identiverse (Las Vegas, US), 28-31 May
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('24807a92-5d40-4aa5-bfd0-bfa40abb2b0b', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Identiverse (Las Vegas, US), 28-31 May', 'identiverse las vegas us 28 31 may', null, null, null, null, null, 60, 'pending_review', 'Events!Row76', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '24807a92-5d40-4aa5-bfd0-bfa40abb2b0b', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Heliview IAM (Zeist, NL), 30 May
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('0f6e1f60-d566-4994-bd1a-a2616c4704f7', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Heliview IAM (Zeist, NL), 30 May', 'heliview iam zeist nl 30 may', null, null, null, null, null, 60, 'pending_review', 'Events!Row77', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '0f6e1f60-d566-4994-bd1a-a2616c4704f7', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- USENIX Conference on Privacy Engineering Practice and Respect (Santa Clara, US), 3-4 June
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('5893001f-e32e-49e6-ac7f-1320175160a6', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'USENIX Conference on Privacy Engineering Practice and Respect (Santa Clara, US), 3-4 June', 'usenix conference on privacy engineering practice and respect santa clara us 3 4 june', null, null, null, null, null, 60, 'pending_review', 'Events!Row78', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '5893001f-e32e-49e6-ac7f-1320175160a6', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- EIC (Berlin), 4-7 June
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('fec624e6-dc34-4ac1-9522-08eae24bb790', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'EIC (Berlin), 4-7 June', 'eic berlin 4 7 june', null, null, null, null, null, 60, 'pending_review', 'Events!Row79', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'fec624e6-dc34-4ac1-9522-08eae24bb790', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Identity Week (Amsterdam), 11-12 June
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('a426aebb-be95-4d09-bbe0-cfb6d38dcfab', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Identity Week (Amsterdam), 11-12 June', 'identity week amsterdam 11 12 june', null, null, null, null, null, 60, 'pending_review', 'Events!Row80', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'a426aebb-be95-4d09-bbe0-cfb6d38dcfab', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- TNC24 (Rennes, France), 11-14 June
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('7c279f67-668a-466b-a82e-e723a4ade820', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'TNC24 (Rennes, France), 11-14 June', 'tnc24 rennes france 11 14 june', null, null, null, null, null, 60, 'pending_review', 'Events!Row81', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '7c279f67-668a-466b-a82e-e723a4ade820', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- IDM Day, (London, UK), 18 June
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('a8349ccf-0a4c-4a7a-a191-c5adad8be554', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'IDM Day, (London, UK), 18 June', 'idm day london uk 18 june', null, null, null, null, null, 60, 'pending_review', 'Events!Row82', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'a8349ccf-0a4c-4a7a-a191-c5adad8be554', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Digital Identity unConference Europe​, (Zurich) , 18-20 June
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('b92cde8a-b42b-4c64-98a6-e0061a0ee886', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Digital Identity unConference Europe​, (Zurich) , 18-20 June', 'digital identity unconference europe zurich 18 20 june', null, null, null, null, null, 60, 'pending_review', 'Events!Row83', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b92cde8a-b42b-4c64-98a6-e0061a0ee886', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Open Identity Summit (Porto, Portugal), 20-21 June
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('d8509f85-ef25-4f2c-a1a8-9c887e8c6a60', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Open Identity Summit (Porto, Portugal), 20-21 June', 'open identity summit porto portugal 20 21 june', null, null, null, null, null, 60, 'pending_review', 'Events!Row84', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'd8509f85-ef25-4f2c-a1a8-9c887e8c6a60', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- IETF 120 (Vancouver, BC), 20-26 July {Standards Development}
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('95a38bfc-e298-4557-a0b7-df1ccc6f5470', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'IETF 120 (Vancouver, BC), 20-26 July {Standards Development}', 'ietf 120 vancouver bc 20 26 july standards development', null, null, null, null, null, 60, 'pending_review', 'Events!Row85', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '95a38bfc-e298-4557-a0b7-df1ccc6f5470', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Blackhat (Las Vegas, Nevada, US), 3-8 August
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('de19db68-05e4-47a1-b618-9b4e62eadc97', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Blackhat (Las Vegas, Nevada, US), 3-8 August', 'blackhat las vegas nevada us 3 8 august', null, null, null, null, null, 60, 'pending_review', 'Events!Row86', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'de19db68-05e4-47a1-b618-9b4e62eadc97', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- DefCon 33 (Las Vegas, Nevada, US) 8-11 August
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('5658b105-2c98-4aca-b37a-f4dffafe7704', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'DefCon 33 (Las Vegas, Nevada, US) 8-11 August', 'defcon 33 las vegas nevada us 8 11 august', null, null, null, null, null, 60, 'pending_review', 'Events!Row87', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '5658b105-2c98-4aca-b37a-f4dffafe7704', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Identity Week America, 11-12 September
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('4ca9d0cf-c967-42de-b695-1b772f2435d2', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Identity Week America, 11-12 September', 'identity week america 11 12 september', null, null, null, null, null, 60, 'pending_review', 'Events!Row88', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '4ca9d0cf-c967-42de-b695-1b772f2435d2', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- TPAC 2024 (Anaheim, California, US), 23-27 September {Standards Development}
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('0a6bfe9b-b89d-439b-a11f-8043333112ed', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'TPAC 2024 (Anaheim, California, US), 23-27 September {Standards Development}', 'tpac 2024 anaheim california us 23 27 september standards development', null, null, null, null, null, 60, 'pending_review', 'Events!Row89', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '0a6bfe9b-b89d-439b-a11f-8043333112ed', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Digital Identity unConference Africa​ (Zurich), 23-27 September
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('06f377b1-1246-4a3c-8d0a-402dd36fd077', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Digital Identity unConference Africa​ (Zurich), 23-27 September', 'digital identity unconference africa zurich 23 27 september', null, null, null, null, null, 60, 'pending_review', 'Events!Row90', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '06f377b1-1246-4a3c-8d0a-402dd36fd077', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Authenticate (Carlsbad, California, US), 14-16 October
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('817f0310-90ee-4f3f-9bab-e6d0251aa77c', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Authenticate (Carlsbad, California, US), 14-16 October', 'authenticate carlsbad california us 14 16 october', null, null, null, null, null, 60, 'pending_review', 'Events!Row91', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '817f0310-90ee-4f3f-9bab-e6d0251aa77c', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- EDUCAUSE (San Antonio, Texas, US), 21-24 October
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('acd1c8f3-f300-408c-a98c-a1d3810da88e', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'EDUCAUSE (San Antonio, Texas, US), 21-24 October', 'educause san antonio texas us 21 24 october', null, null, null, null, null, 60, 'pending_review', 'Events!Row92', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'acd1c8f3-f300-408c-a98c-a1d3810da88e', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Identity Week Asia (Singapore), 22-23 October
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('1da8e0d7-9018-4c8a-9117-45683165c012', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Identity Week Asia (Singapore), 22-23 October', 'identity week asia singapore 22 23 october', null, null, null, null, null, 60, 'pending_review', 'Events!Row93', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '1da8e0d7-9018-4c8a-9117-45683165c012', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- IIW XXXVIX Fall 2024 (Mountain View, California, US), 29-31 October {Standards Development}
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('85e01b86-beed-41b3-8845-2d9f863a290d', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'IIW XXXVIX Fall 2024 (Mountain View, California, US), 29-31 October {Standards Development}', 'iiw xxxvix fall 2024 mountain view california us 29 31 october standards development', null, null, null, null, null, 60, 'pending_review', 'Events!Row94', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '85e01b86-beed-41b3-8845-2d9f863a290d', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- IETF 121 (Dublin, IE), 2-8 November {Standards Development}
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('d70f7946-4f07-44c4-bdaa-163f661f37f1', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'IETF 121 (Dublin, IE), 2-8 November {Standards Development}', 'ietf 121 dublin ie 2 8 november standards development', null, null, null, null, null, 60, 'pending_review', 'Events!Row95', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'd70f7946-4f07-44c4-bdaa-163f661f37f1', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Internet2 TechEx (Boston, Massachusets, US), 9-12 December
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('15956cfb-4307-4337-a1a4-1926bab47c3a', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Internet2 TechEx (Boston, Massachusets, US), 9-12 December', 'internet2 techex boston massachusets us 9 12 december', null, null, null, null, null, 60, 'pending_review', 'Events!Row96', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '15956cfb-4307-4337-a1a4-1926bab47c3a', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Gartner IAM, (Grapevine, Texas, US), 9-11 December
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('867851ca-11fc-4b55-829f-dd47ee09845a', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Gartner IAM, (Grapevine, Texas, US), 9-11 December', 'gartner iam grapevine texas us 9 11 december', null, null, null, null, null, 60, 'pending_review', 'Events!Row97', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '867851ca-11fc-4b55-829f-dd47ee09845a', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- My Security TV
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('70a3366e-b27f-41a6-9fc4-ca435ead3f7c', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'My Security TV', 'my security tv', 'https://mysecuritymarketplace.com/av-channel/mysectv/', null, null, null, null, 60, 'pending_review', 'CyberRisk TV!Row2', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '70a3366e-b27f-41a6-9fc4-ca435ead3f7c', 'positioning', 'strength', '{"kind":"strength","text":"Our mission is to equip you with the skills and connections you need to prepare for what’s next and fast approaching. With a rapidly growing product suite and tool sets, we also deliver the latest news, reviews, expert-led courses and world-leading events. \r\nSeparates main page leads into \"Professionals\" and \"Businesses\""}'::jsonb, 'Our mission is to equip you with the skills and connections you need to prepare for what’s next and fast approaching. With a rapidly growing product suite and tool sets, we also deliver the latest news, reviews, expert-led courses and world-leading events. 
Separates main page leads into "Professionals" and "Businesses"', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('69bec32d-f51a-459c-ba80-f9b03a4497bd', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '70a3366e-b27f-41a6-9fc4-ca435ead3f7c', 'mysecuritymarketplace.com/solutions-new-arrivals', 'mysecuritymarketplace com solutions new arrivals', 'https://mysecuritymarketplace.com/solutions-new-arrivals/', 60, 'pending_review', 'CyberRisk TV!Row2', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '69bec32d-f51a-459c-ba80-f9b03a4497bd', 80, 3500, 'USD', 'FREE LISTING FOR 30 DAYS	
	
STANDARD ANNUAL LISTING
$ 80 USD PER MONTH ($960 USD TOTAL)	
Minimum 1 year
Solution listed on MySecurity Marketplace
Banner or Tile advert for 30 days across 1 x website (your choice of preferred month in your 1 year listing period)1 social post

PREMIUM PROMOTION PACKAGE	
$ 1500 USD FOR 30 DAYS
2 social posts
Solution listed on MySecurity Marketplace
Solution listed in weekly newsletter
Banner or tile advert for 30 days across 2 x websites

PLATINUM PROMOTION PACKAGE
$ 3500 USD FOR 90 DAYS
4 social posts
Solution listed on MySecurity Marketplace
Solution listed in weekly newsletter
1 EDM
Banner or Tile advert for 90 days across 3 x websites', 60, now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '70a3366e-b27f-41a6-9fc4-ca435ead3f7c', 'ecbcb000-54e3-4a5f-9f10-0ca8acfa1a8d', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '70a3366e-b27f-41a6-9fc4-ca435ead3f7c', 'c658d81e-490d-40f3-b8fc-3df0dd8e5587', 'adjacent', 60, null, now(), true);

-- Cyber.org
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('e8032f65-a873-4811-acfe-c79157b3c527', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Cyber.org', 'cyber org', 'https://cyber.org/cybersafety', null, null, null, null, 60, 'pending_review', 'CyberRisk TV!Row3', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e8032f65-a873-4811-acfe-c79157b3c527', 'positioning', 'strength', '{"kind":"strength","text":"CYBER.ORG''s goal is to empower educators as they prepare the next generation to succeed in the cyber workforce of tomorrow."}'::jsonb, 'CYBER.ORG''s goal is to empower educators as they prepare the next generation to succeed in the cyber workforce of tomorrow.', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e8032f65-a873-4811-acfe-c79157b3c527', 'ecbcb000-54e3-4a5f-9f10-0ca8acfa1a8d', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'e8032f65-a873-4811-acfe-c79157b3c527', 'f067a804-b0d3-4bbe-8301-11dbb5f85bc5', 'adjacent', 60, null, now(), true);

-- Trend Micro
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('1d00eb41-d325-479e-b8b5-e0a2f73eab77', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Trend Micro', 'trend micro', 'https://www.trendmicro.com/en_us/business.html', null, null, null, null, 60, 'pending_review', 'CyberRisk TV!Row4', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '1d00eb41-d325-479e-b8b5-e0a2f73eab77', 'ecbcb000-54e3-4a5f-9f10-0ca8acfa1a8d', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '1d00eb41-d325-479e-b8b5-e0a2f73eab77', 'b07777f9-e2ba-4814-a96b-fcf6ef02d1f2', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '1d00eb41-d325-479e-b8b5-e0a2f73eab77', '3af266af-0c76-4297-8646-2a8a3e4c6d42', 'adjacent', 60, null, now(), true);

-- Summit7
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('d2e1cbe3-b646-49e0-8a11-a671b23bbf82', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Summit7', 'summit7', 'https://www.summit7.us/', null, null, null, null, 60, 'pending_review', 'CyberRisk TV!Row5', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'd2e1cbe3-b646-49e0-8a11-a671b23bbf82', 'positioning', 'strength', '{"kind":"strength","text":"compliance"}'::jsonb, 'compliance', 60, 'import', 'pending');
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'd2e1cbe3-b646-49e0-8a11-a671b23bbf82', 'positioning', 'weakness', '{"kind":"weakness","text":"real-time expert insights and trends"}'::jsonb, 'real-time expert insights and trends', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('5fbacb8f-6f7b-437a-8e5f-cbd819367702', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'd2e1cbe3-b646-49e0-8a11-a671b23bbf82', 'www.summit7.us/cmmc-level-solution-sets', 'www summit7 us cmmc level solution sets', 'https://www.summit7.us/cmmc-level-solution-sets', 60, 'pending_review', 'CyberRisk TV!Row5', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'd2e1cbe3-b646-49e0-8a11-a671b23bbf82', 'ecbcb000-54e3-4a5f-9f10-0ca8acfa1a8d', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'd2e1cbe3-b646-49e0-8a11-a671b23bbf82', 'f067a804-b0d3-4bbe-8301-11dbb5f85bc5', 'adjacent', 60, null, now(), true);

-- GRCAcademy
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('d3209e3a-6970-48a7-a1a2-081d4129485e', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'GRCAcademy', 'grcacademy', 'https://grcacademy.io/', null, null, null, null, 60, 'pending_review', 'CyberRisk TV!Row6', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'd3209e3a-6970-48a7-a1a2-081d4129485e', 'positioning', 'strength', '{"kind":"strength","text":"compliance, NIST, CMMC"}'::jsonb, 'compliance, NIST, CMMC', 60, 'import', 'pending');
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'd3209e3a-6970-48a7-a1a2-081d4129485e', 'positioning', 'weakness', '{"kind":"weakness","text":"real-time expert insights and trends"}'::jsonb, 'real-time expert insights and trends', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('2740e2aa-978d-4861-9e79-90c670b57191', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'd3209e3a-6970-48a7-a1a2-081d4129485e', 'grcacademy.io/courses', 'grcacademy io courses', 'https://grcacademy.io/courses/', 60, 'pending_review', 'CyberRisk TV!Row6', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'd3209e3a-6970-48a7-a1a2-081d4129485e', 'ecbcb000-54e3-4a5f-9f10-0ca8acfa1a8d', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'd3209e3a-6970-48a7-a1a2-081d4129485e', 'c658d81e-490d-40f3-b8fc-3df0dd8e5587', 'adjacent', 60, null, now(), true);

-- Cybersecurity Ventures/Cybercrime Magazine
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('7bbcda7e-13c2-4471-ad9a-7300258a8f8e', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Cybersecurity Ventures/Cybercrime Magazine', 'cybersecurity ventures cybercrime magazine', 'https://cybersecurityventures.com/', null, null, null, null, 60, 'pending_review', 'CyberRisk TV!Row7', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '7bbcda7e-13c2-4471-ad9a-7300258a8f8e', 'positioning', 'strength', '{"kind":"strength","text":"Cybersecurity Ventures is the world’s leading researcher and Page ONE for the global cyber economy, and a trusted source for cybersecurity facts, figures, and statistics."}'::jsonb, 'Cybersecurity Ventures is the world’s leading researcher and Page ONE for the global cyber economy, and a trusted source for cybersecurity facts, figures, and statistics.', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('af75c417-3a83-45d8-a449-f640fc3fd33b', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '7bbcda7e-13c2-4471-ad9a-7300258a8f8e', 'cybersecurityventures.com/research', 'cybersecurityventures com research', 'https://cybersecurityventures.com/research/', 60, 'pending_review', 'CyberRisk TV!Row7', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '7bbcda7e-13c2-4471-ad9a-7300258a8f8e', 'ecbcb000-54e3-4a5f-9f10-0ca8acfa1a8d', 'adjacent', 60, 'Unmapped source tokens: Digital Advertising, virtual roundtables', now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '7bbcda7e-13c2-4471-ad9a-7300258a8f8e', 'd9438672-9bdd-4aa1-8de8-ff590ef92e97', 'adjacent', 60, 'Unmapped source tokens: Digital Advertising, virtual roundtables', now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '7bbcda7e-13c2-4471-ad9a-7300258a8f8e', 'e3ec49d7-1d59-4e74-bfff-44edfd1853b5', 'adjacent', 60, 'Unmapped source tokens: Digital Advertising, virtual roundtables', now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '7bbcda7e-13c2-4471-ad9a-7300258a8f8e', 'c658d81e-490d-40f3-b8fc-3df0dd8e5587', 'adjacent', 60, 'Unmapped source tokens: Digital Advertising, virtual roundtables', now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '7bbcda7e-13c2-4471-ad9a-7300258a8f8e', 'ead6bd90-f29a-42c0-a704-52ea5175d4e0', 'adjacent', 60, 'Unmapped source tokens: Digital Advertising, virtual roundtables', now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '7bbcda7e-13c2-4471-ad9a-7300258a8f8e', 'c8024d09-09de-474b-91ec-986562143d24', 'adjacent', 60, 'Unmapped source tokens: Digital Advertising, virtual roundtables', now(), true);

-- CyberDaily (UK)
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('cb66861b-c8d6-46c2-838c-fef3d8fd5159', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'CyberDaily (UK)', 'cyberdaily uk', 'www.youtube.com/@Cyber_Daily', null, null, null, null, 60, 'pending_review', 'CyberRisk TV!Row9', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'cb66861b-c8d6-46c2-838c-fef3d8fd5159', 'positioning', 'strength', '{"kind":"strength","text":"We welcome applications from leaders who meet the following criteria:\r\n\r\nActive CISOs and Security leaders\r\nPracticing CISOs prepared to assume leadership roles within the next 9 months\r\nCISOs at organisations with a minimum of 250 employees"}'::jsonb, 'We welcome applications from leaders who meet the following criteria:

Active CISOs and Security leaders
Practicing CISOs prepared to assume leadership roles within the next 9 months
CISOs at organisations with a minimum of 250 employees', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'cb66861b-c8d6-46c2-838c-fef3d8fd5159', 'ecbcb000-54e3-4a5f-9f10-0ca8acfa1a8d', 'adjacent', 60, null, now(), true);
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'cb66861b-c8d6-46c2-838c-fef3d8fd5159', 'c658d81e-490d-40f3-b8fc-3df0dd8e5587', 'adjacent', 60, null, now(), true);

-- Qualtrics
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('39887563-e4c5-4247-9272-57ff64dae7a1', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Qualtrics', 'qualtrics', 'https://www.qualtrics.com/', null, null, null, null, 60, 'pending_review', 'CyberCept!Row2', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '39887563-e4c5-4247-9272-57ff64dae7a1', 'positioning', 'strength', '{"kind":"strength","text":"Software for advanced quantitative and qualitative\r\nresearch to design products people love, increase\r\nmarket share, and accelerate growth."}'::jsonb, 'Software for advanced quantitative and qualitative
research to design products people love, increase
market share, and accelerate growth.', 60, 'import', 'pending');
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '39887563-e4c5-4247-9272-57ff64dae7a1', 'positioning', 'weakness', '{"kind":"weakness","text":"6-8 weeks to ramp up"}'::jsonb, '6-8 weeks to ramp up', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('3176417c-4f8d-466b-a908-b8dced271b71', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '39887563-e4c5-4247-9272-57ff64dae7a1', 'www.qualtrics.com/strategy', 'www qualtrics com strategy', 'https://www.qualtrics.com/strategy/research/', 60, 'pending_review', 'CyberCept!Row2', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '3176417c-4f8d-466b-a908-b8dced271b71', 20, 57000, 'USD', 'Strategy and Research ($20K annually with 5,000 confirmed interactions) - testing, validation, product development, design and distribute content to list. Research services can find new leads
Website Intercepts ($25K-$35K annually) - Lead genration and demand gen

Annual license for Frontline Digital + StrategicResearch
+ 3-year agreement
+ Unlimited users, quote based on 20K annual interactions
License:
+ Year 1: $53,000
+ Year 2: $55,000
+ Year 3: $57,000

License includes:
+ Diagnose improvement areas by triggering intercepts at keymoments of the journey on your website (100 intercepts, allcreative types).
+ Equip team with AI-powered, real-time insights.
+ Optimize key drivers of performance and surface focusareas for actionable changes.
+ Understand the customer journey across all touchpoints topersonalize experiences.
+ Efficiently and effectively close the loop with customers toconvert bad experiences into exceptional experiences.
+ Automate advanced statistical analyses including Conjointand MaxDiff.
+ Utilize video feedback to gain a deeper understanding of youraudiences and bring data to life for key stakeholders.
+ Mine qualitative data for actionable insights using ML, AI, andnatural language processing.
+ Recruit and nurture proprietary research panels,create an engaging panelist experience, and run targetedstudies using customer profiles that get richer over time.', 60, now());
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('6b4c1fbf-dc72-422a-b662-7c724d588dd5', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '39887563-e4c5-4247-9272-57ff64dae7a1', 'www.qualtrics.com/frontline', 'www qualtrics com frontline', 'https://www.qualtrics.com/frontline/digital/', 60, 'pending_review', 'CyberCept!Row2', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '6b4c1fbf-dc72-422a-b662-7c724d588dd5', 20, 57000, 'USD', 'Strategy and Research ($20K annually with 5,000 confirmed interactions) - testing, validation, product development, design and distribute content to list. Research services can find new leads
Website Intercepts ($25K-$35K annually) - Lead genration and demand gen

Annual license for Frontline Digital + StrategicResearch
+ 3-year agreement
+ Unlimited users, quote based on 20K annual interactions
License:
+ Year 1: $53,000
+ Year 2: $55,000
+ Year 3: $57,000

License includes:
+ Diagnose improvement areas by triggering intercepts at keymoments of the journey on your website (100 intercepts, allcreative types).
+ Equip team with AI-powered, real-time insights.
+ Optimize key drivers of performance and surface focusareas for actionable changes.
+ Understand the customer journey across all touchpoints topersonalize experiences.
+ Efficiently and effectively close the loop with customers toconvert bad experiences into exceptional experiences.
+ Automate advanced statistical analyses including Conjointand MaxDiff.
+ Utilize video feedback to gain a deeper understanding of youraudiences and bring data to life for key stakeholders.
+ Mine qualitative data for actionable insights using ML, AI, andnatural language processing.
+ Recruit and nurture proprietary research panels,create an engaging panelist experience, and run targetedstudies using customer profiles that get richer over time.', 60, now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '39887563-e4c5-4247-9272-57ff64dae7a1', '7468516b-216f-43a3-9950-7f3dd8112de1', 'adjacent', 60, null, now(), true);

-- Pyramid
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('12569380-6053-4de4-a40c-5dee6dfc51b3', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Pyramid', 'pyramid', 'https://www.pyramidanalytics.com/', null, null, null, null, 60, 'pending_review', 'CyberCept!Row3', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '12569380-6053-4de4-a40c-5dee6dfc51b3', 'positioning', 'strength', '{"kind":"strength","text":"BI-cycle has partnered with Pyramid to handle data/analytics/BI projects\r\nRelationship is relatively new and they are willing to be flexible with new projects\r\n\r\nCustom analytics platform deployed on your chosen server platform\r\nPyramid’s lightning-fast direct query performance helps you spot trends, uncover business realities, and make sharper decisions. \r\nPyramid’s powerful business intelligence solutions help you sidestep disastrous decisions and capitalize on advantages you might not have otherwise seen.\r\nWith Pyramid’s Decision Intelligence Platform being super flexible, power users can push the system hard to drill down into details, while non-technical users can use BI analytics to create meaningful visualizations with no coding required."}'::jsonb, 'BI-cycle has partnered with Pyramid to handle data/analytics/BI projects
Relationship is relatively new and they are willing to be flexible with new projects

Custom analytics platform deployed on your chosen server platform
Pyramid’s lightning-fast direct query performance helps you spot trends, uncover business realities, and make sharper decisions. 
Pyramid’s powerful business intelligence solutions help you sidestep disastrous decisions and capitalize on advantages you might not have otherwise seen.
With Pyramid’s Decision Intelligence Platform being super flexible, power users can push the system hard to drill down into details, while non-technical users can use BI analytics to create meaningful visualizations with no coding required.', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('3a0109a3-3740-473d-bbf7-e99413c6a621', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '12569380-6053-4de4-a40c-5dee6dfc51b3', 'www.pyramidanalytics.com/solutions', 'www pyramidanalytics com solutions', 'https://www.pyramidanalytics.com/solutions/', 60, 'pending_review', 'CyberCept!Row3', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '3a0109a3-3740-473d-bbf7-e99413c6a621', 50, 80, 'USD', '$50K-$80K annual', 60, now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '12569380-6053-4de4-a40c-5dee6dfc51b3', '7468516b-216f-43a3-9950-7f3dd8112de1', 'adjacent', 60, null, now(), true);
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '12569380-6053-4de4-a40c-5dee6dfc51b3', 'c1a4a687-5cdd-4042-bda4-6d5e0eca3238', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '12569380-6053-4de4-a40c-5dee6dfc51b3', 'a8e9869b-57a9-4820-b9c8-64f0671a6228', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '12569380-6053-4de4-a40c-5dee6dfc51b3', '51fc8f67-bb50-4178-9f10-c0712c5d9038', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '12569380-6053-4de4-a40c-5dee6dfc51b3', '3fa5fd25-9ce3-4fe5-a71c-e6fa61994837', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '12569380-6053-4de4-a40c-5dee6dfc51b3', '4ca091ff-edc8-4902-a116-4af942aa7fe5', 'unknown', 60, now());

-- Funnel
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('dc1e6f60-0d8e-4064-8765-e2e27b450e46', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Funnel', 'funnel', 'https://funnel.io/', null, null, null, null, 60, 'pending_review', 'CyberCept!Row4', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'dc1e6f60-0d8e-4064-8765-e2e27b450e46', 'positioning', 'strength', '{"kind":"strength","text":"With Funnel, you can have all your data together in one place for analyzing and reporting.\r\n\r\nConnect - Quickly bring all of your marketing data together from any source.\r\n\r\nStore - Securely store all of your data in our centralized hub.\r\n\r\nOrganize - Transform raw data without code to automatically make it ready for analysis.\r\n\r\nVisualize - Visualize your data through customizable dashboards for reporting and KPI monitoring.\r\n\r\nShare - Easily collaborate and share your data with any team or tool."}'::jsonb, 'With Funnel, you can have all your data together in one place for analyzing and reporting.

Connect - Quickly bring all of your marketing data together from any source.

Store - Securely store all of your data in our centralized hub.

Organize - Transform raw data without code to automatically make it ready for analysis.

Visualize - Visualize your data through customizable dashboards for reporting and KPI monitoring.

Share - Easily collaborate and share your data with any team or tool.', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('d42053ec-f33c-4918-b944-51781c87c9c3', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'dc1e6f60-0d8e-4064-8765-e2e27b450e46', 'funnel.io/digital-marketing', 'funnel io digital marketing', 'https://funnel.io/digital-marketing', 60, 'pending_review', 'CyberCept!Row4', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'd42053ec-f33c-4918-b944-51781c87c9c3', 1100, 1100, 'USD', 'Starter
Begin your journey to data-driven marketing with our Starter plan.
Starts Free With 350 flexpoints
E.g. 5 connectors + Funnel Dashboards
Get started now
Get started for free! Additional flexpoints can be purchased in the Funnel platform.
Choose from 230+ Core connectors
Funnel core connectors
Choose from 3 destinations
Funnel destinations
Visualize your data with Funnel Dashboards


Business
Tap into the power of our marketing data hub. Rock-solid reporting infrastructure and guided onboarding.
Starts at $1100 USD/month
Billed annually
With 1000 flexpoints
E.g. 7 connectors + 1 data warehouse
Choose from 230+ Core connectors
Choose from 9 destinations
Visualize your data with Funnel Dashboards
Up to 3 custom connectors
Guided standard setup
Multiple workspaces
User roles and permissions

Enterprise
Designed for organizations operating at scale. Enterprise-ready features, support and services.
Choose from 230+ Core connectors
Choose from 10 destinations
Visualize your data with Funnel Dashboards
Up to 10 custom connectors
Guided advanced setup
Multiple workspaces
User roles and permissions
Enterprise Single Sign-On
Data region choice (EU or US)
Technical Advisory Program
Multi-entity usage¹', 60, now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'dc1e6f60-0d8e-4064-8765-e2e27b450e46', '7468516b-216f-43a3-9950-7f3dd8112de1', 'adjacent', 60, null, now(), true);
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'dc1e6f60-0d8e-4064-8765-e2e27b450e46', 'e9913e1c-0a3b-4880-b738-2a371fe31756', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'dc1e6f60-0d8e-4064-8765-e2e27b450e46', '131add08-1d1a-4bf2-99c2-ec4eda4bdc86', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'dc1e6f60-0d8e-4064-8765-e2e27b450e46', 'c74b994d-23cd-42ee-ab6a-6fe3c854feac', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'dc1e6f60-0d8e-4064-8765-e2e27b450e46', '4120bfa7-50c2-4c9e-9ea6-e6120e2d1d8a', 'unknown', 60, now());

-- GWI
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('5f0b80c8-caaa-4610-91c3-7da43443a90c', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'GWI', 'gwi', 'https://www.gwi.com/', null, null, null, null, 60, 'pending_review', 'CyberCept!Row5', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '5f0b80c8-caaa-4610-91c3-7da43443a90c', 'positioning', 'strength', '{"kind":"strength","text":"The leading audience targeting company for the global marketing industry, we show you how consumers think. \r\n\r\nOur consumer research platform makes finding in-depth insights easy, with smart tools that help you become an expert on any audience.\r\nBuild and compare audiences\r\nSee what drives them to buy\r\nExplore 250K+ profiling points"}'::jsonb, 'The leading audience targeting company for the global marketing industry, we show you how consumers think. 

Our consumer research platform makes finding in-depth insights easy, with smart tools that help you become an expert on any audience.
Build and compare audiences
See what drives them to buy
Explore 250K+ profiling points', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('19e25c74-63c6-46e1-ab19-5ccda9dfc2bc', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '5f0b80c8-caaa-4610-91c3-7da43443a90c', 'www.gwi.com/platform', 'www gwi com platform', 'https://www.gwi.com/platform', 60, 'pending_review', 'CyberCept!Row5', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '5f0b80c8-caaa-4610-91c3-7da43443a90c', '7468516b-216f-43a3-9950-7f3dd8112de1', 'adjacent', 60, null, now(), true);
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '5f0b80c8-caaa-4610-91c3-7da43443a90c', '161928d6-7874-4c57-928d-4c473222ff0d', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '5f0b80c8-caaa-4610-91c3-7da43443a90c', 'd16441aa-accc-4244-8a8c-89c730be2fe9', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '5f0b80c8-caaa-4610-91c3-7da43443a90c', 'a7db0688-8a6f-4cd8-b781-3d372c935e87', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '5f0b80c8-caaa-4610-91c3-7da43443a90c', 'fc690b09-d27f-4214-a589-535e3de25f2e', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '5f0b80c8-caaa-4610-91c3-7da43443a90c', '2b769950-7ad6-4a59-96df-48ed51d2209b', 'unknown', 60, now());

-- Quid
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('aba94440-5c87-413d-be2f-5951677c27d9', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Quid', 'quid', 'https://www.quid.com/', null, null, null, null, 60, 'pending_review', 'CyberCept!Row6', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'aba94440-5c87-413d-be2f-5951677c27d9', 'positioning', 'strength', '{"kind":"strength","text":"Consumer and market intelligence platform that helps businesses manage campaigns, product development, brand crisis, and more.\r\n\r\nDesigned for midsize to large businesses, a social media analytics solution that helps analyze campaign performances, monitor brand mentions, conduct sentiment analysis, and more.\r\n\r\nAs consumer behaviors and market dynamics shift at unprecedented speeds, Quid delivers the crucial foresight to ensure you remain a step ahead.\r\n\r\nQuid Discover helps you look at all your customers'' data in a totally new way. Millions of raw data points from different channels are organized, connected, and visualized. Creating customer context that lets you see what’s next and allows you to deeply understand the conversation and prioritize what matters. Unmet needs are found, trends are uncovered, and strategic decisions are made with unprecedented, efficient clarity.\r\n\r\n\r\nFocuses on potential ROI of their solutions"}'::jsonb, 'Consumer and market intelligence platform that helps businesses manage campaigns, product development, brand crisis, and more.

Designed for midsize to large businesses, a social media analytics solution that helps analyze campaign performances, monitor brand mentions, conduct sentiment analysis, and more.

As consumer behaviors and market dynamics shift at unprecedented speeds, Quid delivers the crucial foresight to ensure you remain a step ahead.

Quid Discover helps you look at all your customers'' data in a totally new way. Millions of raw data points from different channels are organized, connected, and visualized. Creating customer context that lets you see what’s next and allows you to deeply understand the conversation and prioritize what matters. Unmet needs are found, trends are uncovered, and strategic decisions are made with unprecedented, efficient clarity.


Focuses on potential ROI of their solutions', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('14eb79ac-f02b-4068-bf06-335f46de251f', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'aba94440-5c87-413d-be2f-5951677c27d9', 'www.quid.com/product-full-suite', 'www quid com product full suite', 'https://www.quid.com/product-full-suite', 60, 'pending_review', 'CyberCept!Row6', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '14eb79ac-f02b-4068-bf06-335f46de251f', 23, 23, 'USD', 'Starting at $23K per year', 60, now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'aba94440-5c87-413d-be2f-5951677c27d9', '7468516b-216f-43a3-9950-7f3dd8112de1', 'adjacent', 60, null, now(), true);
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'aba94440-5c87-413d-be2f-5951677c27d9', 'baac514d-4baf-485c-8334-c89d025f1153', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'aba94440-5c87-413d-be2f-5951677c27d9', '2b4380e0-ede1-4ff7-ba64-b7ffbb2328b6', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'aba94440-5c87-413d-be2f-5951677c27d9', '685d220a-8119-4e90-be24-3a7214658d4f', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'aba94440-5c87-413d-be2f-5951677c27d9', 'cbb8da7e-1ce1-409e-86c9-a05e2283d9e7', 'unknown', 60, now());

-- site-seeker
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('6f69133d-3a05-4120-94b9-d228055c6992', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'site-seeker', 'site seeker', 'https://www.site-seeker.com/', null, null, null, null, 60, 'pending_review', 'CyberCept!Row7', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '6f69133d-3a05-4120-94b9-d228055c6992', 'positioning', 'strength', '{"kind":"strength","text":"Site-Insights uses reverse IP lookup to give us a better glimpse into the users coming to your website. In other words, we can identify visitors by business name! And we work to turn them into sales opportunities.\r\nGrow Your Business Faster\r\nIdentify website visitors\r\nOrganize and nurture leads\r\nSales teams only focus on qualified leads\r\nUse within existing marketing program\r\n97% of website visitors leave your website without ever contacting you! Use Site-Insights to boost your conversion rates and close more deals."}'::jsonb, 'Site-Insights uses reverse IP lookup to give us a better glimpse into the users coming to your website. In other words, we can identify visitors by business name! And we work to turn them into sales opportunities.
Grow Your Business Faster
Identify website visitors
Organize and nurture leads
Sales teams only focus on qualified leads
Use within existing marketing program
97% of website visitors leave your website without ever contacting you! Use Site-Insights to boost your conversion rates and close more deals.', 60, 'import', 'pending');
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '6f69133d-3a05-4120-94b9-d228055c6992', 'positioning', 'weakness', '{"kind":"weakness","text":"Doesn''t get deeper than a list of LinkedIn pages."}'::jsonb, 'Doesn''t get deeper than a list of LinkedIn pages.', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('16362878-5365-49f5-b09d-cb638301768c', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '6f69133d-3a05-4120-94b9-d228055c6992', 'www.site-seeker.com/site-insights', 'www site seeker com site insights', 'https://www.site-seeker.com/site-insights/', 60, 'pending_review', 'CyberCept!Row7', now());
insert into pricing_history (organization_id, product_id, price_min, price_max, currency, raw_price_text, confidence_score, observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '16362878-5365-49f5-b09d-cb638301768c', 5, 10, 'USD', '$5K/year for Site Seeker
Learn websites and LinkedIn pages of website visitors

$7-$10K/year for Web Sites
Learn Which pages visited and how many times, websites and LinkedIn pages of website visitors', 60, now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '6f69133d-3a05-4120-94b9-d228055c6992', '7468516b-216f-43a3-9950-7f3dd8112de1', 'adjacent', 60, null, now(), true);

-- Infinitive
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('1132820b-7009-438b-8b32-6b7d0c28eb87', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Infinitive', 'infinitive', 'https://www.infinitive.com/', null, null, null, null, 60, 'pending_review', 'CyberCept!Row8', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '1132820b-7009-438b-8b32-6b7d0c28eb87', 'positioning', 'strength', '{"kind":"strength","text":"We are a technology and transformation consultancy helping our clients successfully move, analyze, manage, and monetize their data in the cloud. As a full-service provider, we are here to guide you through all aspects of your project."}'::jsonb, 'We are a technology and transformation consultancy helping our clients successfully move, analyze, manage, and monetize their data in the cloud. As a full-service provider, we are here to guide you through all aspects of your project.', 60, 'import', 'pending');
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '1132820b-7009-438b-8b32-6b7d0c28eb87', 'positioning', 'weakness', '{"kind":"weakness","text":"No \"marketing\" offerings"}'::jsonb, 'No "marketing" offerings', 60, 'import', 'pending');
insert into products (id, organization_id, company_id, name, normalized_name, product_url, confidence_score, intelligence_status, original_import_reference, first_observed_at) values ('5f6a8a36-df9f-40ad-bc45-e8b6170b05ad', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '1132820b-7009-438b-8b32-6b7d0c28eb87', 'www.infinitive.com/content-data-monetization', 'www infinitive com content data monetization', 'https://www.infinitive.com/content-data-monetization/', 60, 'pending_review', 'CyberCept!Row8', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '1132820b-7009-438b-8b32-6b7d0c28eb87', '7468516b-216f-43a3-9950-7f3dd8112de1', 'adjacent', 60, null, now(), true);
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '1132820b-7009-438b-8b32-6b7d0c28eb87', '8d8f24e9-44b9-4610-8133-35273e9e53b4', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '1132820b-7009-438b-8b32-6b7d0c28eb87', 'c24b1cfe-8e78-4f4b-a04c-7842b4543ca5', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '1132820b-7009-438b-8b32-6b7d0c28eb87', '96c4a747-17c9-4f96-9e3d-268e5a67a8fc', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '1132820b-7009-438b-8b32-6b7d0c28eb87', '02fd8cc8-6330-485a-94cb-a400f1b79908', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '1132820b-7009-438b-8b32-6b7d0c28eb87', 'baaae462-9017-4203-b2f2-6263f3d9065d', 'unknown', 60, now());

-- TechTarget Priority Engine
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('61957cdf-3049-4c6a-b12a-aeb03ec03012', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'TechTarget Priority Engine', 'techtarget priority engine', 'https://www.techtarget.com/products/priority-engine/', null, null, null, null, 60, 'pending_review', 'CyberCept!Row9', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '61957cdf-3049-4c6a-b12a-aeb03ec03012', 'positioning', 'strength', '{"kind":"strength","text":"Priority Engine™ drives opportunities to closed-won 35% faster by delivering real, active buyers at in-market accounts."}'::jsonb, 'Priority Engine™ drives opportunities to closed-won 35% faster by delivering real, active buyers at in-market accounts.', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '61957cdf-3049-4c6a-b12a-aeb03ec03012', '7468516b-216f-43a3-9950-7f3dd8112de1', 'adjacent', 60, null, now(), true);

-- DemandBase
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('bba00f87-fa49-43d9-b186-6890c11eaa98', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'DemandBase', 'demandbase', 'https://www.demandbase.com/', null, null, null, null, 60, 'pending_review', 'CyberCept!Row10', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'bba00f87-fa49-43d9-b186-6890c11eaa98', 'positioning', 'weakness', '{"kind":"weakness","text":"Segment filtering by priority or operation\r\nSegment exports could have more data within them\r\nSometimes the model isn''t as accurate as we''d like\r\nSkepticism on where the views/searches are coming from\r\nThere are errors/glitches but they have great support to help.\r\nCan be slow at times.\r\nUser experience in the Salesforce dashboard isn''t as nice as the main interface."}'::jsonb, 'Segment filtering by priority or operation
Segment exports could have more data within them
Sometimes the model isn''t as accurate as we''d like
Skepticism on where the views/searches are coming from
There are errors/glitches but they have great support to help.
Can be slow at times.
User experience in the Salesforce dashboard isn''t as nice as the main interface.', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'bba00f87-fa49-43d9-b186-6890c11eaa98', '7468516b-216f-43a3-9950-7f3dd8112de1', 'adjacent', 60, null, now(), true);

-- 6Sense
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('542fd7cd-85e4-4f56-91c7-ae5a5190b863', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '6Sense', '6sense', 'https://6sense.com/', null, null, null, null, 60, 'pending_review', 'CyberCept!Row11', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '542fd7cd-85e4-4f56-91c7-ae5a5190b863', 'positioning', 'strength', '{"kind":"strength","text":"The 6sense Account Engagement Platform helps B2B organizations achieve predictable revenue growth by putting the power of AI, big data, and machine learning behind every member of the revenue team. 6sense uncovers anonymous buying behavior, prioritizes accounts for sales and marketing"}'::jsonb, 'The 6sense Account Engagement Platform helps B2B organizations achieve predictable revenue growth by putting the power of AI, big data, and machine learning behind every member of the revenue team. 6sense uncovers anonymous buying behavior, prioritizes accounts for sales and marketing', 60, 'import', 'pending');
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '542fd7cd-85e4-4f56-91c7-ae5a5190b863', 'positioning', 'weakness', '{"kind":"weakness","text":"Predictive scoring\r\n: Account only, limited 1st party, black box\r\nNo product data or marketing data\r\nSales data: Account Only"}'::jsonb, 'Predictive scoring
: Account only, limited 1st party, black box
No product data or marketing data
Sales data: Account Only', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '542fd7cd-85e4-4f56-91c7-ae5a5190b863', '7468516b-216f-43a3-9950-7f3dd8112de1', 'adjacent', 60, null, now(), true);

-- CyberTheory
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('c739d477-608e-4879-9386-2d897037ca1a', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'CyberTheory', 'cybertheory', 'https://cybertheory.io/account-based-marketing-abm-the-future-of-targeted-b2b-campaigns/', null, null, null, null, 60, 'pending_review', 'CyberCept!Row12', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'c739d477-608e-4879-9386-2d897037ca1a', 'positioning', 'strength', '{"kind":"strength","text":"Cybertheory is your on-demand marketing partner for all your cybersecurity marketing and communication needs."}'::jsonb, 'Cybertheory is your on-demand marketing partner for all your cybersecurity marketing and communication needs.', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'c739d477-608e-4879-9386-2d897037ca1a', '7468516b-216f-43a3-9950-7f3dd8112de1', 'adjacent', 60, null, now(), true);
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'c739d477-608e-4879-9386-2d897037ca1a', '2de9b828-dc91-4566-bb17-f88760d36de8', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'c739d477-608e-4879-9386-2d897037ca1a', '4bb7c8e1-9305-47fb-934e-2494acff3bef', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'c739d477-608e-4879-9386-2d897037ca1a', '06703e5b-98ac-4983-a154-a2461c11e9dc', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'c739d477-608e-4879-9386-2d897037ca1a', 'd42a1479-642a-486d-9733-0f786de8ecdb', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'c739d477-608e-4879-9386-2d897037ca1a', '59435453-fbf3-4359-9c20-431f10d56320', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'c739d477-608e-4879-9386-2d897037ca1a', 'b6d783e3-ca8b-4e8e-9a52-2ac57004d3a5', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'c739d477-608e-4879-9386-2d897037ca1a', 'cd7717fb-bb1a-4ab7-91ab-da2c61b80afc', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'c739d477-608e-4879-9386-2d897037ca1a', 'f9956869-c416-49a5-8d48-0d91a14ee07d', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'c739d477-608e-4879-9386-2d897037ca1a', '238b914d-1a09-4ab0-918b-31e675b8ba70', 'unknown', 60, now());

-- Audience1st
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('6609239e-1e05-45c4-b4ba-419a2efb3354', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Audience1st', 'audience1st', 'https://www.audience1st.fm/', null, null, null, null, 60, 'pending_review', 'CyberCept!Row13', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '6609239e-1e05-45c4-b4ba-419a2efb3354', 'positioning', 'strength', '{"kind":"strength","text":"Data-Driven Cybersecurity Marketing Agency\r\n\r\nMake Better GTM Decisions with Cybersecurity Buyer Intelligence. Instantly.\r\nThe Cyber Brain is the trusted buyer intelligence platform for cybersecurity marketers and sales professionals. Access real evidence from qualitative, voice-of-the-customer data with intuitive AI search, flexible wiki functionality, and a customizable portal to win more customers."}'::jsonb, 'Data-Driven Cybersecurity Marketing Agency

Make Better GTM Decisions with Cybersecurity Buyer Intelligence. Instantly.
The Cyber Brain is the trusted buyer intelligence platform for cybersecurity marketers and sales professionals. Access real evidence from qualitative, voice-of-the-customer data with intuitive AI search, flexible wiki functionality, and a customizable portal to win more customers.', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '6609239e-1e05-45c4-b4ba-419a2efb3354', '7468516b-216f-43a3-9950-7f3dd8112de1', 'adjacent', 60, null, now(), true);
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '6609239e-1e05-45c4-b4ba-419a2efb3354', '9a89702c-a0d3-4317-bf5a-1dc8cb00d276', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '6609239e-1e05-45c4-b4ba-419a2efb3354', '3295ffd7-dcfb-49e5-9ca7-569cb9949a6a', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '6609239e-1e05-45c4-b4ba-419a2efb3354', '62556962-11c3-4d1a-ae2a-d4834a2ebde6', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '6609239e-1e05-45c4-b4ba-419a2efb3354', '5957787b-23ec-4985-8bb5-bd027c4f40f8', 'unknown', 60, now());
insert into company_customers (organization_id, company_id, customer_id, relationship_type, confidence_score, first_observed_at) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '6609239e-1e05-45c4-b4ba-419a2efb3354', '093c4d02-d3f9-48ec-854c-dfa65ac49632', 'unknown', 60, now());

-- RB2B
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('8072f2a0-142e-46bb-b887-13efbf2e52d5', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'RB2B', 'rb2b', 'https://www.rb2b.com/', null, null, null, null, 60, 'pending_review', 'CyberCept!Row14', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '8072f2a0-142e-46bb-b887-13efbf2e52d5', 'positioning', 'strength', '{"kind":"strength","text":"RB2B is an advanced digital platform tailored for the B2B sector, designed to revolutionize the way businesses identify and engage with anonymous website visitors. At its heart, RB2B employs sophisticated algorithms to decipher the digital footprint of each visitor, allowing businesses to recognize potential clients at an individual level, even in the absence of direct interaction or registration. This powerful capability extends beyond mere identification; it provides deep insights into the buying intent of these visitors.\r\n\r\n \r\n\r\nBy analyzing patterns of behavior, visited pages, and interaction with content, RB2B can gauge the level of interest and potential investment intent of each visitor. This enables businesses to not only personalize the user experience in real-time but also to tailor their marketing and sales strategies to align with the identified buying signals. The result is a more focused approach to engagement, where efforts are concentrated on visitors who show a higher propensity for conversion.\r\n\r\n \r\n\r\nIncorporating RB2B into your digital strategy transforms anonymous traffic into actionable intelligence, offering a strategic advantage in nurturing leads and driving sales. This approach ensures that businesses are not merely attracting visitors but are engaging with potential buyers, thereby maximizing the efficiency of their online presence."}'::jsonb, 'RB2B is an advanced digital platform tailored for the B2B sector, designed to revolutionize the way businesses identify and engage with anonymous website visitors. At its heart, RB2B employs sophisticated algorithms to decipher the digital footprint of each visitor, allowing businesses to recognize potential clients at an individual level, even in the absence of direct interaction or registration. This powerful capability extends beyond mere identification; it provides deep insights into the buying intent of these visitors.

 

By analyzing patterns of behavior, visited pages, and interaction with content, RB2B can gauge the level of interest and potential investment intent of each visitor. This enables businesses to not only personalize the user experience in real-time but also to tailor their marketing and sales strategies to align with the identified buying signals. The result is a more focused approach to engagement, where efforts are concentrated on visitors who show a higher propensity for conversion.

 

Incorporating RB2B into your digital strategy transforms anonymous traffic into actionable intelligence, offering a strategic advantage in nurturing leads and driving sales. This approach ensures that businesses are not merely attracting visitors but are engaging with potential buyers, thereby maximizing the efficiency of their online presence.', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '8072f2a0-142e-46bb-b887-13efbf2e52d5', '7468516b-216f-43a3-9950-7f3dd8112de1', 'adjacent', 60, null, now(), true);

-- TrustRadius
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('b2cc8bde-4a7d-4cc5-b0e4-847fcd7acc6a', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'TrustRadius', 'trustradius', 'https://www.trustradius.com/', null, null, null, null, 60, 'pending_review', 'CyberCept!Row15', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b2cc8bde-4a7d-4cc5-b0e4-847fcd7acc6a', '7468516b-216f-43a3-9950-7f3dd8112de1', 'adjacent', 60, null, now(), true);

-- Qualified
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('f50a895a-b238-4d61-b512-1b1f3f8da94c', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Qualified', 'qualified', 'https://www.qualified.com/', null, null, null, null, 60, 'pending_review', 'CyberCept!Row16', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'f50a895a-b238-4d61-b512-1b1f3f8da94c', '7468516b-216f-43a3-9950-7f3dd8112de1', 'adjacent', 60, null, now(), true);

-- Clearbit
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('c721c1b8-bfbe-4299-88b4-591f520c6d49', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Clearbit', 'clearbit', 'https://clearbit.com/', null, null, null, null, 60, 'pending_review', 'CyberCept!Row17', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'c721c1b8-bfbe-4299-88b4-591f520c6d49', '7468516b-216f-43a3-9950-7f3dd8112de1', 'adjacent', 60, null, now(), true);

-- MadKudu
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('dc0ba7de-4859-48c7-b617-1fcd9c11c4a1', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'MadKudu', 'madkudu', 'https://www.madkudu.com/', null, null, null, null, 60, 'pending_review', 'CyberCept!Row18', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'dc0ba7de-4859-48c7-b617-1fcd9c11c4a1', '7468516b-216f-43a3-9950-7f3dd8112de1', 'adjacent', 60, null, now(), true);

-- Founder Story
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('5cdc0de3-26f0-41ad-add7-71a45fd57eb7', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Founder Story', 'founder story', 'https://www.founderstory.io/', null, null, null, null, 60, 'pending_review', 'Founder Stories!Row2', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '5cdc0de3-26f0-41ad-add7-71a45fd57eb7', 'positioning', 'strength', '{"kind":"strength","text":"A series of interviews featuring leading startup founders, entrepreneurs, industry experts and thought leaders, we dive deep into the intricacies behind the lessons they’ve learned along their founding journey. Each episode presents valuable learning material and aims to, encourage, uplift and motivate the leaders of tomorrow."}'::jsonb, 'A series of interviews featuring leading startup founders, entrepreneurs, industry experts and thought leaders, we dive deep into the intricacies behind the lessons they’ve learned along their founding journey. Each episode presents valuable learning material and aims to, encourage, uplift and motivate the leaders of tomorrow.', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '5cdc0de3-26f0-41ad-add7-71a45fd57eb7', 'ead6bd90-f29a-42c0-a704-52ea5175d4e0', 'adjacent', 60, null, now(), true);

-- Cinch IT - Founders Story Podcast
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('b00a4915-830d-4a36-823d-db574c230d9d', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Cinch IT - Founders Story Podcast', 'cinch it founders story podcast', 'https://cinchfranchise.com/founders-story-podcast/', null, null, null, null, 60, 'pending_review', 'Founder Stories!Row3', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b00a4915-830d-4a36-823d-db574c230d9d', 'positioning', 'strength', '{"kind":"strength","text":"In the Founders Story Podcast, you’ll learn from local entrepreneurs as they discuss their journey from their first inspiration to their first employee and the steps they took to get there."}'::jsonb, 'In the Founders Story Podcast, you’ll learn from local entrepreneurs as they discuss their journey from their first inspiration to their first employee and the steps they took to get there.', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'b00a4915-830d-4a36-823d-db574c230d9d', 'ead6bd90-f29a-42c0-a704-52ea5175d4e0', 'adjacent', 60, null, now(), true);

-- Founders Stories
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('993bdd03-f017-468a-933d-a6e062d76281', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Founders Stories', 'founders stories', 'https://podcasts.apple.com/ca/podcast/founders-stories/id1481911839', null, null, null, null, 60, 'pending_review', 'Founder Stories!Row4', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '993bdd03-f017-468a-933d-a6e062d76281', 'positioning', 'strength', '{"kind":"strength","text":"A show about ordinary people on a journey to build their own exceptional businesses.\r\n\r\n\r\nHost Brian Scudamore, founder and CEO of O2E Brands, is on a mission to uncover the founders stories of some of our most inspiring people – from the decisions that lead them to take the leap, to the celebrations and lessons that follow."}'::jsonb, 'A show about ordinary people on a journey to build their own exceptional businesses.


Host Brian Scudamore, founder and CEO of O2E Brands, is on a mission to uncover the founders stories of some of our most inspiring people – from the decisions that lead them to take the leap, to the celebrations and lessons that follow.', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '993bdd03-f017-468a-933d-a6e062d76281', 'ead6bd90-f29a-42c0-a704-52ea5175d4e0', 'adjacent', 60, null, now(), true);

-- Startups.com
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('95e0c6c5-9aaf-4d7f-a713-be2f87c3a45f', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Startups.com', 'startups com', 'https://www.startups.com/library/founder-stories', null, null, null, null, 60, 'pending_review', 'Founder Stories!Row5', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '95e0c6c5-9aaf-4d7f-a713-be2f87c3a45f', 'positioning', 'strength', '{"kind":"strength","text":"Personal, candid interviews with the most world-changing Founders of all time."}'::jsonb, 'Personal, candid interviews with the most world-changing Founders of all time.', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '95e0c6c5-9aaf-4d7f-a713-be2f87c3a45f', 'ead6bd90-f29a-42c0-a704-52ea5175d4e0', 'adjacent', 60, null, now(), true);

-- Mercury - Founder Stories
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('de2ca31b-cac5-4af4-b30d-342460bd6314', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Mercury - Founder Stories', 'mercury founder stories', 'https://mercury.com/blog/founder-stories', null, null, null, null, 60, 'pending_review', 'Founder Stories!Row6', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'de2ca31b-cac5-4af4-b30d-342460bd6314', 'positioning', 'strength', '{"kind":"strength","text":"five-part founder video series shares inspirational stories of founders we admire and the ambitious companies they’re building"}'::jsonb, 'five-part founder video series shares inspirational stories of founders we admire and the ambitious companies they’re building', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'de2ca31b-cac5-4af4-b30d-342460bd6314', 'ead6bd90-f29a-42c0-a704-52ea5175d4e0', 'adjacent', 60, null, now(), true);

-- The Founder Hour
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('fa61c4a0-c3da-4731-973d-9e9b67844b14', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'The Founder Hour', 'the founder hour', 'https://www.thefounderhour.com/', null, null, null, null, 60, 'pending_review', 'Founder Stories!Row7', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'fa61c4a0-c3da-4731-973d-9e9b67844b14', 'positioning', 'strength', '{"kind":"strength","text":"A podcast featuring inspiring stories and conversations with the founders, creators, and entrepreneurs shaping the future."}'::jsonb, 'A podcast featuring inspiring stories and conversations with the founders, creators, and entrepreneurs shaping the future.', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'fa61c4a0-c3da-4731-973d-9e9b67844b14', 'ead6bd90-f29a-42c0-a704-52ea5175d4e0', 'adjacent', 60, null, now(), true);

-- Founders Story with Rick Porter
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('a329ca91-0b46-4eae-a2f8-f8e774a87ded', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Founders Story with Rick Porter', 'founders story with rick porter', 'https://foundersstory.buzzsprout.com/', null, null, null, null, 60, 'pending_review', 'Founder Stories!Row8', 'active', now());
insert into observations (organization_id, company_id, observation_type, field_name, observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'a329ca91-0b46-4eae-a2f8-f8e774a87ded', 'positioning', 'strength', '{"kind":"strength","text":"In the Founders Story Podcast, you’ll learn from local entrepreneurs as they discuss their journey from their first inspiration to their first employee and the steps they took to get there. Listen to the Founders Story to hear how these entrepreneurs gained the success they enjoy today."}'::jsonb, 'In the Founders Story Podcast, you’ll learn from local entrepreneurs as they discuss their journey from their first inspiration to their first employee and the steps they took to get there. Listen to the Founders Story to hear how these entrepreneurs gained the success they enjoy today.', 60, 'import', 'pending');
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'a329ca91-0b46-4eae-a2f8-f8e774a87ded', 'ead6bd90-f29a-42c0-a704-52ea5175d4e0', 'adjacent', 60, null, now(), true);

-- Cybersecurity Myth Busters
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('dcd297cd-8699-4283-a775-16ff2266fe17', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Cybersecurity Myth Busters', 'cybersecurity myth busters', 'https://www.globalknowledge.com/us-en/content/cybersecurity-myth-busters/#gref', null, null, null, null, 60, 'pending_review', 'Mythbusters!Row2', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'dcd297cd-8699-4283-a775-16ff2266fe17', '06e93402-4e6b-4837-88d7-18f97cd7bdf7', 'adjacent', 60, null, now(), true);

-- Cybersecurity Mythbusters by BrightTALK
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('0f15e269-a846-47f4-bfca-82986d9362ca', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Cybersecurity Mythbusters by BrightTALK', 'cybersecurity mythbusters by brighttalk', 'https://series.brighttalk.com/series/6067/', null, null, null, null, 60, 'pending_review', 'Mythbusters!Row3', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '0f15e269-a846-47f4-bfca-82986d9362ca', '06e93402-4e6b-4837-88d7-18f97cd7bdf7', 'adjacent', 60, null, now(), true);

-- Acast
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('636c2655-959a-4a95-aec9-bdf12a3cd359', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Acast', 'acast', null, null, null, null, null, 60, 'pending_review', 'Podcasts!Row4', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '636c2655-959a-4a95-aec9-bdf12a3cd359', 'c658d81e-490d-40f3-b8fc-3df0dd8e5587', 'adjacent', 60, null, now(), true);

-- AudioGo
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('8418d2f5-e94f-4fa4-955d-46da82725ac9', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'AudioGo', 'audiogo', null, null, null, null, null, 60, 'pending_review', 'Podcasts!Row6', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '8418d2f5-e94f-4fa4-955d-46da82725ac9', 'c658d81e-490d-40f3-b8fc-3df0dd8e5587', 'adjacent', 60, null, now(), true);

-- LibSyn
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('41c3fc10-fc9f-44b5-9f12-bbd0f226bf0d', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'LibSyn', 'libsyn', null, null, null, null, null, 60, 'pending_review', 'Podcasts!Row7', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '41c3fc10-fc9f-44b5-9f12-bbd0f226bf0d', 'c658d81e-490d-40f3-b8fc-3df0dd8e5587', 'adjacent', 60, null, now(), true);

-- CyberWire Daily
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('87cd82cf-fe55-40da-8502-afc4cc74ed0c', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'CyberWire Daily', 'cyberwire daily', null, null, null, null, null, 60, 'pending_review', 'Podcasts!Row8', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '87cd82cf-fe55-40da-8502-afc4cc74ed0c', 'c658d81e-490d-40f3-b8fc-3df0dd8e5587', 'adjacent', 60, null, now(), true);

-- Hacker Valley Studio
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('6b6bc980-d0b5-4ed2-9a68-fce379b710c7', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Hacker Valley Studio', 'hacker valley studio', null, null, null, null, null, 60, 'pending_review', 'Podcasts!Row9', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '6b6bc980-d0b5-4ed2-9a68-fce379b710c7', 'c658d81e-490d-40f3-b8fc-3df0dd8e5587', 'adjacent', 60, null, now(), true);

-- Security Now
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('5e301de7-1218-4590-a287-9ce7bc342663', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Security Now', 'security now', null, null, null, null, null, 60, 'pending_review', 'Podcasts!Row10', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '5e301de7-1218-4590-a287-9ce7bc342663', 'c658d81e-490d-40f3-b8fc-3df0dd8e5587', 'adjacent', 60, null, now(), true);

-- Unsupervised Learning
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('5aa11c90-f2e1-4012-90a8-b97bbf5718d7', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Unsupervised Learning', 'unsupervised learning', null, null, null, null, null, 60, 'pending_review', 'Podcasts!Row11', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '5aa11c90-f2e1-4012-90a8-b97bbf5718d7', 'c658d81e-490d-40f3-b8fc-3df0dd8e5587', 'adjacent', 60, null, now(), true);

-- Smashing Security
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('f58ef732-612b-4d64-ae0a-9a47757cc2c7', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Smashing Security', 'smashing security', null, null, null, null, null, 60, 'pending_review', 'Podcasts!Row12', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'f58ef732-612b-4d64-ae0a-9a47757cc2c7', 'c658d81e-490d-40f3-b8fc-3df0dd8e5587', 'adjacent', 60, null, now(), true);

-- Darknet Diaries
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('ada5614e-9d65-40a0-8d75-cc9f2266d74a', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Darknet Diaries', 'darknet diaries', null, null, null, null, null, 60, 'pending_review', 'Podcasts!Row13', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ada5614e-9d65-40a0-8d75-cc9f2266d74a', 'c658d81e-490d-40f3-b8fc-3df0dd8e5587', 'adjacent', 60, null, now(), true);

-- Hacking Humans
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('556c54c0-a25c-4629-8075-76719ee71f13', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Hacking Humans', 'hacking humans', null, null, null, null, null, 60, 'pending_review', 'Podcasts!Row14', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '556c54c0-a25c-4629-8075-76719ee71f13', 'c658d81e-490d-40f3-b8fc-3df0dd8e5587', 'adjacent', 60, null, now(), true);

-- Risky Business
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('ecba0f67-025e-4c75-91d3-e191149baf01', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Risky Business', 'risky business', null, null, null, null, null, 60, 'pending_review', 'Podcasts!Row15', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'ecba0f67-025e-4c75-91d3-e191149baf01', 'c658d81e-490d-40f3-b8fc-3df0dd8e5587', 'adjacent', 60, null, now(), true);

-- Breaking Into Cybersecurity:
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('66bca73f-71c5-4f4b-b798-421b830f8eef', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Breaking Into Cybersecurity:', 'breaking into cybersecurity', null, null, null, null, null, 60, 'pending_review', 'Podcasts!Row16', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '66bca73f-71c5-4f4b-b798-421b830f8eef', 'c658d81e-490d-40f3-b8fc-3df0dd8e5587', 'adjacent', 60, null, now(), true);

-- Malicious Life
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('cadcf5e6-a9a0-457b-98f0-bd100d776a6e', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Malicious Life', 'malicious life', null, null, null, null, null, 60, 'pending_review', 'Podcasts!Row17', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'cadcf5e6-a9a0-457b-98f0-bd100d776a6e', 'c658d81e-490d-40f3-b8fc-3df0dd8e5587', 'adjacent', 60, null, now(), true);

-- Down the Security Rabbithole
insert into companies (id, organization_id, name, normalized_name, website_url, linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, original_import_reference, status, first_observed_at) values ('3aefd258-b626-4905-aec2-720102dd8473', 'b7df7779-1c40-4878-8711-ae1ccdcbf1b4', 'Down the Security Rabbithole', 'down the security rabbithole', null, null, null, null, null, 60, 'pending_review', 'Podcasts!Row18', 'active', now());
insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, relationship_type, confidence_score, notes, first_observed_at, active) values ('b7df7779-1c40-4878-8711-ae1ccdcbf1b4', '3aefd258-b626-4905-aec2-720102dd8473', 'c658d81e-490d-40f3-b8fc-3df0dd8e5587', 'adjacent', 60, null, now(), true);
commit;
