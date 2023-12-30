(async () => {
  const { browserBg } = tri;

  const tabs = await browserBg.tabs.query({});

  const code = prompt("JavaScript:");

  const results = await Promise.all(
    tabs.map((tab) => {
      return browserBg.tabs.executeScript(tab.id, {
        code,
      });
    })
  );

  console.log(results);
})();
