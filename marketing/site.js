// Compatibility for bookmarks created by the previous Flutter hash router.
function migrateLegacyLink() {
  const hash = window.location.hash;
  if (!hash.startsWith('#/')) return;
  const old = new URL(hash.slice(1), window.location.origin);
  const path = old.pathname.replace(/\/$/, '') || '/';
  const target = path === '/admin' ? '/' : path;
  if (['/', '/contact', '/inquiry'].includes(target)) {
    window.location.replace(target + old.search);
  }
}
migrateLegacyLink();
window.addEventListener('hashchange', migrateLegacyLink);

// Retire only this site's old Flutter worker and its named caches.
// New pages deliberately do not register an offline app shell.
if ('serviceWorker' in navigator) {
  navigator.serviceWorker.getRegistrations().then(async registrations => {
    for (const registration of registrations) {
      const worker = registration.active || registration.waiting || registration.installing;
      if (worker && new URL(worker.scriptURL).pathname === '/flutter_service_worker.js') {
        await registration.unregister();
      }
    }
    if ('caches' in window) {
      await Promise.all(['flutter-app-cache', 'flutter-temp-cache', 'flutter-app-manifest']
        .map(name => caches.delete(name)));
    }
  }).catch(() => { /* Marketing content works even when storage is unavailable. */ });
}
