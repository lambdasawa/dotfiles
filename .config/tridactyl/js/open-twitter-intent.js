const text = encodeURIComponent(`${location.href} ${document.title}`);

window.open(`https://twitter.com/intent/tweet?text=${text}`, "_blank");
