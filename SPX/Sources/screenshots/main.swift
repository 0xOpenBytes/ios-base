import ScreenshotsLib

let logsPath = "Swish/Screenshots/Logs"
let derivedDataPath = "Swish/Screenshots/DerivedData"
let pngsPath = "Swish/Screenshots/PNGs"
let masksPath = "Swish/Screenshots/Masks"

try Screenshots(
  logsPath: logsPath,
  derivedDataPath: derivedDataPath,
  pngsPath: pngsPath,
  masksPath: masksPath
).go()
