(async () => {
  console.log("Sample Containers JSON:");
  console.log(
    JSON.stringify(
      [
        {
          name: "1",
          icon: "fingerprint",
          color: "red",
        },
        {
          name: "2",
          icon: "food",
          color: "turquoise",
        },
        {
          name: "3",
          icon: "pet",
          color: "orange",
        },
        {
          name: "4",
          icon: "fruit",
          color: "blue",
        },
        {
          name: "5",
          icon: "vacation",
          color: "yellow",
        },
        {
          name: "6",
          icon: "tree",
          color: "purple",
        },
        {
          name: "7",
          icon: "dollar",
          color: "green",
        },
        {
          name: "8",
          icon: "gift",
          color: "pink",
        },
      ],
      null,
      2
    )
  );

  const { browserBg } = tri;

  const containers = JSON.parse(prompt("Containers JSON:"));
  await Promise.all(
    containers.map(({ name, color, icon }) => {
      browserBg.contextualIdentities.create({ name, color, icon });
    })
  );
})();
