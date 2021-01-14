const selected = window.getSelection().toString();
const encodedSelected = encodeURIComponent(selected);
const url = `https://translate.google.co.jp/?sl=auto&tl=ja&text=${encodedSelected}`;
window.open(url, "_blank");
