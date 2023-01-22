import Sh
import ShGit
import Rainbow

do {

  let git = Git()
  guard try git.isClean()
  else {
    throw Errors.gitRepoNotClean
  }

  let logRoot = "Swish/logs"
  let artifactRoot = "Swish/artifacts"
  try sh(.terminal, "mkdir -p \(logRoot)")
  try sh(.terminal, "mkdir -p \(artifactRoot)")

  try AppStore(secrets: Secrets(), logRoot: logRoot, artifactRoot: artifactRoot).build()

} catch {
  print("error".red, error)
}
