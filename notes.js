function f() {
  let minY = -10000;
  for (let elem of document.querySelectorAll("[role=doc-endnotes] li")) {
    let referent = document.querySelector(
      elem.querySelector("a[role=doc-backlink]").getAttribute("href"),
    );
    let top = referent.getBoundingClientRect().top + window.scrollY;
    if (top <= minY) top = minY;

    elem.style.top = `${top}px`;
    minY = top + elem.getBoundingClientRect().height + 10;
  }
}

setTimeout(f, 0);

addEventListener("resize", f);
