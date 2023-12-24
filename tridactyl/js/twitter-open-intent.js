window.open(
  `https://twitter.com/intent/tweet?text=` +
    encodeURIComponent(`${document.title}\n${location.href}`),
  "_blank",
);
