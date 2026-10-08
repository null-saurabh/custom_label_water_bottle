#!/usr/bin/env python3
"""Local HTTP preview with the same clean URLs and admin redirect as Hosting."""
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path
from urllib.parse import urlsplit
import argparse

ROOT = Path(__file__).resolve().parents[1] / 'build/site'

class Handler(SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=str(ROOT), **kwargs)

    def do_GET(self):
        path = urlsplit(self.path).path
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
        if path in ['/contact', '/inquiry', '/contact-form']:
            self.path = path + '.html'
        return super().do_GET()

    def end_headers(self):
        self.send_header('Cache-Control', 'no-cache')
        super().end_headers()

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--port', type=int, default=8080)
    args = parser.parse_args()
    print(f'Local: http://127.0.0.1:{args.port}', flush=True)
    ThreadingHTTPServer(('127.0.0.1', args.port), Handler).serve_forever()
