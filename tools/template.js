const fs = require("fs").promises
const handlebars = require("handlebars")
const delimiters = require("handlebars-delimiters")
const yargs = require("yargs")

const d = delimiters(handlebars, ["\\[", "\\]"])
handlebars.registerHelper("tld", function (host) {
  const parts = host.split(".")
  const len = parts.length
  return [ parts[len - 2], parts[len - 1]].join(".")
})

async function main () {
  const { $0, _, ...args } = yargs.argv
  const template = await fs.readFile(_[0], "utf-8")
  const t = handlebars.compile(template, {
    noEscape: true,
  })

  console.log(t(args))
}

main().catch(err => console.error(err))
