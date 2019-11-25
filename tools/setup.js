const fs = require("fs").promises
const fse = require("fs-extra")
const path = require("path")
const { spawn } = require("child_process")

const inquirer = require("inquirer")
const template = require("./lib/template")

const base = path.resolve(__dirname, "../template")
const templates = [
  "Makefile",
  "package.json",
]

async function main () {
  log("Initializing new repository")
  const answers = await inquirer.prompt([
    {
      type: "string",
      name: "name",
      default: path.basename(process.cwd()),
    },
    {
      type: "string",
      name: "url",
    },
  ])

  log("Copying files")
  const files = await fs.readdir(base)

  for (const file of files) {
    const pth = path.join(base, file)
    await fse.copy(pth, file)
  }

  log("Executing templates")
  for (const tmp of templates) {
    const pth = path.join(base, tmp)
    const res = await template(pth, answers)
    await fs.writeFile(tmp, res)
  }

  log("Installing packages")
  await yarn()

  log("Done!")
}

main().catch(function (err) {
  console.error(err)
  process.exit(1)
})

function yarn () {
  const child = spawn("yarn", [], {
    cwd: process.cwd(),
    detached: true,
    stdio: "inherit",
  })

  return new Promise(function (resolve, reject) {
    child.on("exit", function (code) {
      if (code === 0) {
        return resolve()
      }
      return reject(new Error("There was an error with yarn"))
    })
  })
}


function log (msg) {
  const color = 29
  const name = "shared"
  const prefix = `\u001B[38;5;${color}m${name}\u001B[0m`

  console.log(prefix, msg)
}
