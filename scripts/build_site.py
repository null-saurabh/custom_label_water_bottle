#!/usr/bin/env python3
"""Build the existing Flutter forms, then add the semantic marketing documents."""
import argparse
import json
import os
from pathlib import Path
import shutil
import subprocess

ROOT = Path(__file__).resolve().parents[1]


def assemble():
    source = ROOT / 'build/web'
    output = ROOT / 'build/site'
    if not (source / 'main.dart.js').is_file():
        raise SystemExit('Flutter build missing. Run without --assemble-only first.')
    if output.exists():
        shutil.rmtree(output)
    shutil.copytree(source, output)
    shell = (source / 'index.html').read_text()
    for path, title, description, content in [
        ('inquiry', 'Bulk Inquiry', 'Request custom branded drinking water bottles for your business.',
         '<h1>Let’s Create Your Custom Branded Water</h1>'
         '<p>Tell us about your brand and requirements. Our team will share samples, pricing &amp; timelines.</p>'
         '<p>No online payment required · Bulk supply specialists · Trusted by restaurants &amp; hotels</p>'
         '<p>The inquiry form asks for your business and contact details, bottle sizes, monthly quantity and delivery information.</p>'),
        ('contact-form', 'Send a Message', 'Send a message about your custom water bottle requirements.',
         '<h1>Send a Message</h1><p>Your Name · Your Email · Mobile Number · Your Message</p>'
         '<p>We’ll respond within 24 business hours.</p>'),
    ]:
        page = shell.replace('<!-- PAGE_TITLE -->', title)
        page = page.replace('<!-- PAGE_DESCRIPTION -->', description)
        page = page.replace('<!-- PAGE_PATH -->', '/' + path)
        page = page.replace('<!-- PAGE_CONTENT -->', content)
        page = page.replace('<!-- PAGE_ROBOTS -->', '<meta name="robots" content="noindex">' if path == 'contact-form' else '')
        (output / (path + '.html')).write_text(page)
    shutil.copytree(ROOT / 'marketing', output, dirs_exist_ok=True)
    shutil.copytree(ROOT / 'assets', output / 'media')
    # Retire cached Flutter app shells for returning visitors.
    (output / 'flutter_service_worker.js').write_text('''self.addEventListener('install', () => self.skipWaiting());
self.addEventListener('activate', event => event.waitUntil((async () => {
  await Promise.all(['flutter-app-cache', 'flutter-temp-cache', 'flutter-app-manifest'].map(name => caches.delete(name)));
  await self.registration.unregister();
  await self.clients.claim();
})()));
''')
    print('Ready: build/site (Home, Contact, Inquiry; internal contact-form view)')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--flutter', default=os.environ.get('FLUTTER_BIN', 'flutter'))
    parser.add_argument('--assemble-only', action='store_true')
    args = parser.parse_args()
    os.chdir(ROOT)
    if not args.assemble_only:
        config = json.loads((ROOT / 'config/firebase-web.json').read_text())
        if config['projectId'] != 'custom-label-bottle':
            raise SystemExit('Refusing to build with an unexpected Firebase project.')
        options = ROOT / 'lib/firebase_options.dart'
        generated = not options.exists()
        if generated:
            fields = '\n'.join(f'      {key}: {json.dumps(value)},' for key, value in config.items())
            options.write_text("import 'package:firebase_core/firebase_core.dart';\n"
                               "class DefaultFirebaseOptions {\n"
                               "  static const currentPlatform = FirebaseOptions(\n" + fields + '\n  );\n}\n')
        try:
            subprocess.run([args.flutter, '--no-version-check', 'pub', 'get', '--offline'], check=True)
            subprocess.run([args.flutter, '--no-version-check', 'build', 'web', '--release', '--no-pub',
                            '--pwa-strategy=none'], check=True)
        finally:
            if generated:
                options.unlink(missing_ok=True)
    assemble()


if __name__ == '__main__':
    main()
