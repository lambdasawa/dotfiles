(async () => {
  const containers = JSON.parse(prompt("Containers JSON:"));
  await Promise.all(
    containers.map(({ name, color, icon }) => {
      tri.browserBg.contextualIdentities.create({ name, color, icon });
    }),
  );
})();
