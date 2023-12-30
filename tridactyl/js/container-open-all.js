(async () => {
  const { browserBg } = tri;

  const containers = await browserBg.contextualIdentities.query({});
  await Promise.all(
    containers.map(({ cookieStoreId }) =>
      browserBg.tabs.create({ cookieStoreId })
    )
  );
})();
