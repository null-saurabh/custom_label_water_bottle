// Delivered at the previous Flutter worker URL to release returning visitors.
self.addEventListener('install', () => self.skipWaiting());
self.addEventListener('activate', event => event.waitUntil((async () => {
  await Promise.all(['flutter-app-cache', 'flutter-temp-cache', 'flutter-app-manifest']
    .map(name => caches.delete(name)));
  await self.registration.unregister();
  await self.clients.claim();
  // A previously controlled page can otherwise keep showing its old app shell.
  for (const client of await self.clients.matchAll({ type: 'window' })) {
    await client.navigate(client.url);
  }
})()));
