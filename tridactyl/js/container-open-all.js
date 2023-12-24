(async () => {
  const containers = await tri.browserBg.contextualIdentities.query({});
  await Promise.all(
    containers.map(({ cookieStoreId }) =>
      tri.browserBg.tabs.create({ cookieStoreId }),
    ),
  );
})();
