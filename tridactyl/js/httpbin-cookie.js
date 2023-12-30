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
  const containersJSON = JSON.parse(prompt("Containers JSON:"));

  const baseUrl = "https://httpbin.org#";

  const code = `
(async () => {
  const params = Object.fromEntries(new URLSearchParams(location.hash.slice(1)));

  async function sleep(ms) {
    return new Promise((resolve) => setTimeout(resolve, ms));
  }

  function setValue(selector, value) {
    const node = document.querySelector(selector);
    Object.getOwnPropertyDescriptor(
      window.HTMLInputElement.prototype,
      "value"
    ).set.call(node, value);
    node.dispatchEvent(new Event("input", { bubbles: true }));
  }

  await sleep(1000 * 3);

  const tag = document.getElementById("operations-tag-Cookies");
  if (!tag.className.includes("is-open")) {
    tag.querySelector(".expand-operation").click();
    await sleep(1000);
  }

  const operation = document.getElementById(
    "operations-Cookies-get_cookies_set__name___value_"
  );
  if (!operation.className.includes("is-open")) {
    operation.querySelector(".opblock-summary.opblock-summary-get").click();
    await sleep(1000);
  }

  const tryItOut = operation.querySelector(".try-out__btn");
  if (tryItOut.textContent.includes("Try it out")) {
    tryItOut.click();
    await sleep(1000);
  }

  setValue("input[placeholder='name']", "foo");
  setValue("input[placeholder='value']", params.foo);
  await sleep(1000);

  document.querySelector(".btn.execute").click();
})();
`;

  // remove all containers
  const oldContainers = await tri.browserBg.contextualIdentities.query({});
  await Promise.all(
    oldContainers.map((c) =>
      tri.browserBg.contextualIdentities.remove(c.cookieStoreId)
    )
  );

  // create containers
  await Promise.all(
    containersJSON.map(({ name, color, icon }) => {
      tri.browserBg.contextualIdentities.create({ name, color, icon });
    })
  );
  const newContainers = await tri.browserBg.contextualIdentities.query({});

  // create tabs
  const tabs = await Promise.all(
    newContainers.map((container) => {
      const c = containersJSON.find((c) => c.name === container.name);
      return tri.browserBg.tabs.create({
        cookieStoreId: container.cookieStoreId,
        url: baseUrl + new URLSearchParams(c.params).toString(),
      });
    })
  );

  // execute script in tabs
  const results = await Promise.all(
    tabs.map((tab) => {
      return tri.browserBg.tabs.executeScript(tab.id, {
        code,
      });
    })
  );

  console.log(results);
})();
