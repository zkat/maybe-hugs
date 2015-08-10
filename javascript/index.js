module.exports = MaybeHug

function MaybeHug (cutie) {
  if (!this) {
    new MaybeHug(cutie).hug()
  } else {
    this.cutie = cutie
  }
}

MaybeHug.prototype.hug = function () {
  return this.cutie.acceptsHugs ? "HUG!" : "Empathy!"
}

