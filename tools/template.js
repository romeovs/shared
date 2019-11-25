const yargs = require("yargs")
const template = require("./lib/template")

async function main () {
  const { $0, _, ...args } = yargs.argv
  const resp = await template(_[0], args)
  console.log(resp)
}

main().catch(err => console.error(err))
