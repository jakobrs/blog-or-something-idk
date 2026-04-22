function f() {
  let i = 0;
  for (let elem of document.querySelectorAll("[role=doc-endnotes] li")) {
    let referent = document.querySelector(
      elem.querySelector("sup[role=doc-backlink]>a").getAttribute("href"),
    );

    console.log(referent);
    referent.style.anchorName = `--ref-${i}`;
    elem.style.anchorName = `--ref-${i}-footnote`;
    if (i == 0) {
      elem.style.top = `anchor(--ref-0 top)`;
    } else {
      elem.style.top = `calc(max(anchor(--ref-${i - 1}-footnote bottom) + 10px, anchor(--ref-${i} top)))`;
    }
    i += 1;
  }
}

setTimeout(f, 0);
