module.exports = MaybeHug

function MaybeHug (cutie) {
  if (cutie === null || cutie === undefined) {
    throw new TypeError("no cutie to maybe hug :(")
  }
  if (!(this instanceof MaybeHug)) {
    return new MaybeHug(cutie).hug()
  } else {
    this.cutie = cutie
  }
}

MaybeHug.prototype.hug = function () {
  return this.cutie.acceptsHugs ? "HUG!" : "Empathy!"
}

