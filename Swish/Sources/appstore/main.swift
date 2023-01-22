import Sh
import ShGit
import Rainbow
import Foundation

struct GitRepoNotCleanError: Error {}

do {
  let git = Git()
  guard try git.isClean()
  else {
    throw GitRepoNotCleanError()
  }

  let logRoot = "Swish/logs"
  let artifactRoot = "Swish/artifacts"
  try sh(.terminal, "mkdir -p \(logRoot)")
  try sh(.terminal, "mkdir -p \(artifactRoot)")

  try AppStore(secrets: Secrets(), logRoot: logRoot, artifactRoot: artifactRoot).build()

} catch {
  print("error".red, error)
}
