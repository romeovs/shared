const fs = require("fs").promises
const handlebars = require("handlebars")
const delimiters = require("handlebars-delimiters")

const d = delimiters(handlebars, ["\\[", "\\]"])
handlebars.registerHelper("tld", function (host) {
  const parts = host.split(".")
  const len = parts.length
  return [ parts[len - 2], parts[len - 1]].join(".")
})

async function template (file, args) {
  const template = await fs.readFile(file, "utf-8")
  const t = handlebars.compile(template, {
    noEscape: true,
  })

  return t(args)
}

module.exports = template
