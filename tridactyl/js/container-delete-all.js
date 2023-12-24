(async () => {
  const containers = await tri.browserBg.contextualIdentities.query({});
  await Promise.all(
    containers.map((c) =>
      tri.browserBg.contextualIdentities.remove(c.cookieStoreId),
    ),
  );
})();
