import { build } from 'esbuild';
import { cp, mkdir, rm, writeFile, readFile } from 'node:fs/promises';
import { resolve } from 'node:path';
const root = resolve(import.meta.dirname, '..');
process.chdir(root);
const output = resolve('build/site');
const config = JSON.parse(await readFile('config/firebase-web.json', 'utf8'));
if (config.projectId !== 'custom-label-bottle') throw new Error('Unexpected Firebase project');
await rm(output, { recursive: true, force: true });
await mkdir(output, { recursive: true });
await cp('marketing', output, { recursive: true, filter: path => !path.includes('marketing/js') });
await cp('assets', `${output}/media`, { recursive: true });
await cp('web/favicon.png', `${output}/favicon.png`);
await build({
  entryPoints: { forms: 'marketing/js/forms.mjs' }, outdir: `${output}/js`,
  bundle: true, splitting: true, format: 'esm', target: ['es2020'],
  minify: true, sourcemap: false, legalComments: 'eof',
});
await cp('marketing/service-worker-retirement.js', `${output}/flutter_service_worker.js`);
await rm(`${output}/service-worker-retirement.js`);
console.log('Built three HTML pages in build/site; no Flutter runtime or iframe.');
