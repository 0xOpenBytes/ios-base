import ScreenshotsLib

let logsPath = "SPX/Screenshots/Logs"
let derivedDataPath = "SPX/Screenshots/DerivedData"
let pngsPath = "SPX/Screenshots/PNGs"
let masksPath = "SPX/Screenshots/Masks"

try Screenshots(
  logsPath: logsPath,
  derivedDataPath: derivedDataPath,
  pngsPath: pngsPath,
  masksPath: masksPath
).go()
