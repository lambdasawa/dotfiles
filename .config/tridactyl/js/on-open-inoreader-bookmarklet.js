setInterval(() => {
  if (document.title.search("完了") !== -1) {
    tri.excmds.tabclose(JS_ARG);
  }

  const button = document.getElementById("submit_button");
  if (button) {
    button.click();
    button.disabled = true;
  }
}, 100);
