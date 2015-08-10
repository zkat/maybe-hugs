var t = require("tap")
var maybeHugs = require("../")

t.test("cutie is required", function (t) {
  t.throws(function () {
    maybeHugs()
  })
  t.throws(function () {
    new maybeHugs().hug()
  })
  t.end()
})

t.test("empathy test", function (t) {
  var noHugs = [
    { acceptsHugs: false },
    { acceptsHugs: null },
    { acceptsHugs: "" },
    { acceptsHugs: 0 },
    {},
    "asdf",
    "",
    false,
    true,
    10,
  ]
  t.plan(noHugs.length * 2)
  noHugs.forEach(function (nh) {
    t.equal(maybeHugs(nh), "Empathy!")
    t.equal(new maybeHugs(nh).hug(), "Empathy!")
  })
})

t.test("hug test", function (t) {
  var yesHugs = [
    { acceptsHugs: true },
    { acceptsHugs: 1000 },
    { acceptsHugs: [] },
    { acceptsHugs: {} },
    { acceptsHugs: /^hugs?/ },
    new (function Huggee () { this.acceptsHugs = this }),
  ]

  t.plan(yesHugs.length * 2)
  yesHugs.forEach(function (yh) {
    t.equal(maybeHugs(yh), "HUG!")
    t.equal(new maybeHugs(yh).hug(), "HUG!")
  })
})
