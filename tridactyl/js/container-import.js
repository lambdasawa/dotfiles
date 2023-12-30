/*
[
  {
    "name": "1",
    "icon": "fingerprint",
    "color": "red",
    "params": { "foo": "fingerprint-red" }
  },
  {
    "name": "2",
    "icon": "food",
    "color": "turquoise",
    "params": { "foo": "food-turquoise" }
  },
  {
    "name": "3",
    "icon": "pet",
    "color": "orange",
    "params": { "foo": "pet-orange" }
  },
  {
    "name": "4",
    "icon": "fruit",
    "color": "blue",
    "params": { "foo": "fruit-blue" }
  },
  {
    "name": "5",
    "icon": "vacation",
    "color": "yellow",
    "params": { "foo": "vacation-yellow" }
  },
  {
    "name": "6",
    "icon": "tree",
    "color": "purple",
    "params": { "foo": "tree-purple" }
  },
  {
    "name": "7",
    "icon": "dollar",
    "color": "green",
    "params": { "foo": "dollar-green" }
  },
  {
    "name": "8",
    "icon": "gift",
    "color": "pink",
    "params": { "foo": "gift-pink" }
  }
]
*/

(async () => {
  const containers = JSON.parse(prompt("Containers JSON:"));
  await Promise.all(
    containers.map(({ name, color, icon }) => {
      tri.browserBg.contextualIdentities.create({ name, color, icon });
    })
  );
})();
