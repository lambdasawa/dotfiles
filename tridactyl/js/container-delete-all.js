(async () => {
  const { browserBg } = tri;

  const containers = await browserBg.contextualIdentities.query({});
  await Promise.all(
    containers.map((c) =>
      browserBg.contextualIdentities.remove(c.cookieStoreId)
    )
  );
})();
