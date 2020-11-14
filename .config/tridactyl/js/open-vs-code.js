const uri = document.location.href.replace(
  /https:\/\/github.com\/([^\/]+)\/([^\/]+)/,
  "~/src/github.com/$1/$2"
);

const cmd = `code -r ${uri}`;

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
