(async () => {
  const { webext } = tri;

  alert(JSON.stringify(await webext.activeTabContainer()));
})();
