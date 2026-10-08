#!/usr/bin/env python3
"""Local HTTP preview with the same clean URLs and admin redirect as Hosting."""
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path
from urllib.parse import urlsplit
import argparse
import json

ROOT = Path(__file__).resolve().parents[1] / 'build/site'

class Handler(SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=str(ROOT), **kwargs)

    def do_GET(self):
        path = urlsplit(self.path).path
        if self.server.mock and path in ['/js/forms.js','/test-source/form-controller.mjs','/test-source/form-domain.mjs']:
            file = ROOT.parent.parent / ('scripts/mock-preview.mjs' if path == '/js/forms.js' else 'marketing/js/' + path.rsplit('/',1)[1])
            self.send_response(200)
            self.send_header('Content-Type', 'text/javascript')
            self.end_headers()
            self.wfile.write(file.read_bytes())
            return
        if path == '/admin' or path.startswith('/admin/'):
            self.send_response(301)
            self.send_header('Location', '/')
            self.end_headers()
            return
        if path.endswith('/') and path != '/':
            self.send_response(301)
            self.send_header('Location', path.rstrip('/'))
            self.end_headers()
            return
        if path == '/contact-form':
            self.send_response(301)
            self.send_header('Location', '/contact#message-form')
            self.end_headers()
            return
        if path in ['/contact', '/inquiry', '/ai-assistant']:
            self.path = path + '.html'
        return super().do_GET()

    def do_POST(self):
        if not self.server.mock or self.path != '/__mock_enquiry':
            self.send_error(405)
            return
        data = json.loads(self.rfile.read(int(self.headers.get('Content-Length', 0))))
        # Only local memory; never forwards, stores, or logs a payload.
        failed = data.get('notes') == 'mock-failure'
        self.send_response(503 if failed else 200)
        self.end_headers()
        self.wfile.write(b'local mock only')

    def end_headers(self):
        if self.server.no_scripts:
            self.send_header('Content-Security-Policy', "script-src 'none'; object-src 'none'")
        self.send_header('Cache-Control', 'no-cache')
        super().end_headers()

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--port', type=int, default=8080)
    parser.add_argument('--mock', action='store_true')
    parser.add_argument('--no-scripts', action='store_true')
    args = parser.parse_args()
    print(f'Local: http://127.0.0.1:{args.port}', flush=True)
    server = ThreadingHTTPServer(('127.0.0.1', args.port), Handler)
    server.mock = args.mock
    server.no_scripts = args.no_scripts
    server.serve_forever()
