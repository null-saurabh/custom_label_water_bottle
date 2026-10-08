#!/usr/bin/env python3
"""Check built HTML, local assets, navigation, metadata and retained form sources."""
from html.parser import HTMLParser
from pathlib import Path
import json
import re
import subprocess
from urllib.parse import urlsplit

ROOT = Path(__file__).resolve().parents[1]
SITE = ROOT / 'build/site'

class Document(HTMLParser):
    def __init__(self, source):
        super().__init__(convert_charrefs=True)
        self.nodes = []
        self.feed(source)
    def handle_starttag(self, tag, attrs):
        self.nodes.append((tag, dict(attrs)))

for name, canonical in [('index','/'),('contact','/contact'),('inquiry','/inquiry')]:
    source = (SITE / f'{name}.html').read_text()
    doc = Document(source)
    assert '<!-- PAGE_' not in source, name
    assert ('html', {'lang':'en'}) in doc.nodes, name
    assert len([1 for tag,a in doc.nodes if tag == 'h1']) == 1, name
    assert any(tag == 'link' and a.get('rel') == 'canonical' and a.get('href') == 'https://sauravcloud.online'+canonical for tag,a in doc.nodes), name
    assert any(tag == 'meta' and a.get('name') == 'viewport' for tag,a in doc.nodes), name
    for tag,a in doc.nodes:
        if tag == 'img':
            assert 'alt' in a, (name,a)
        for key in ('href','src'):
            target = a.get(key,'')
            if not target.startswith('/') or target.startswith('//'):continue
            path = urlsplit(target).path
            candidates = [SITE / path.lstrip('/'),SITE / (path.lstrip('/')+'.html')]
            if path == '/': candidates += [SITE/'index.html']
            assert any(p.is_file() for p in candidates), (name,target)
        if tag == 'a' and a.get('href','').startswith('#'):
            assert any(b.get('id') == a['href'][1:] for _,b in doc.nodes), (name,a)
    if name in ('index','contact','inquiry'):
        assert 'flutter_bootstrap' not in source
        assert 'main.dart.js' not in source
    assert '<iframe' not in source
    if name in ('contact','inquiry'):
        assert any(t == 'form' for t,a in doc.nodes), name
        assert any(t == 'input' and a.get('name') == 'phone' for t,a in doc.nodes), name
        assert not any(t == 'style' and 'display:none' in str(a) for t,a in doc.nodes)
assert not (SITE/'main.dart.js').exists()

for name in ['index','contact','inquiry','404']:
    source = (SITE / f'{name}.html').read_text()
    for forbidden in ['support@yourwater.com','8112552320','Business Complex','query=Patna','Quality Certified','Hospitality Trusted','Trusted by','24 business hours','5x00','2024']:
        assert forbidden not in source, (name,forbidden)
    assert 'href="/#samples"' in source, name
    assert 'aria-label="Footer navigation"' in source, name
    assert 'Ink &amp; Drink' in source, name
    assert 'tel:+918597788095' in source, name
    assert 'https://wa.me/918597788095' in source, name
    assert 'support@sauravcloud.online' not in source, name

contact=(SITE/'contact.html').read_text()
for value in ['IGIMS Gate No. 2, Raja Bazar, Sheikhpura','Patna, Bihar 800014, India','Monday–Saturday: 9 AM–6 PM IST','Sunday: closed','IGIMS%20Gate%20No.%202']:
    assert value in contact, value

# Keep Dart reference implementations unchanged; JS behavior/schema parity is tested in html-forms.test.mjs.
for path in ['lib/models/enquiry_form_model.dart','lib/services/enquiry_service.dart','lib/web pages/contact_us_screen/widgets/contact_hero_left/widgets/contact_form_card.dart']:
    before = subprocess.check_output(['git','show',f'57d2665:{path}'],cwd=ROOT)
    assert before == (ROOT/path).read_bytes(), path
assert not subprocess.check_output(['git','diff','57d2665','--','lib/web pages/inquiry_screen'],cwd=ROOT)
assert not (ROOT/'lib/web pages/admin_homepage.dart').exists()
assert "path: '/admin'" not in (ROOT/'lib/core/router.dart').read_text()
config=json.loads((ROOT/'firebase.json').read_text())
assert list(config) == ['hosting']
assert config['hosting']['site'] == 'custom-label-bottle'
assert config['hosting']['cleanUrls'] is True
assert any(r['source']=='/admin' and r['destination']=='/' for r in config['hosting']['redirects'])
assert 'Disallow: /\n' not in (SITE/'robots.txt').read_text()
for font in re.findall(r'url\((/fonts/[^)]+)\)',(SITE/'fonts/fonts.css').read_text()):
    assert (SITE/font.lstrip('/')).is_file(), font
print('PASS: semantic pages, metadata, links/assets, no placeholders/unsupported claims, retained backend schema, removed Admin and Hosting-only scope')
