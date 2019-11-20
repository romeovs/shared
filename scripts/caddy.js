const fs = require("fs").promises
const handlebars = require("handlebars")

async function main () {
  const template = await fs.readFile("./Caddyfile", "utf-8")
  const t = handlebars.compile(template, {
    noEscape: true,
  })

  console.log(t({
    hosts: process.env.HOSTS.split(","),
    root: process.env.ROOT,
  }))
}

main().catch(err => console.error(err))
