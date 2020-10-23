const cmd = `cd ~/Downloads && youtube-dl -f mp4 ${location.href}`;

alert(`Start command: ${cmd}`);

tri.native
  .run(cmd)
  .then((result) => {
    alert([`$ ${cmd}`, `Exit code: ${result.code}`, result.content].join("\n"));
    console.log(cmd, result);
  })
  .catch((e) => {
    alert(cmd, e);
    console.error(cmd, result);
  });
