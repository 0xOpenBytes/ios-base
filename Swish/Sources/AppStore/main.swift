import AppStoreLib
import Foundation


let logRoot = "Swish/logs"
let artifactRoot = "Swish/artifacts"

try FileManager.default.createDirectory(atPath: logRoot,
                                        withIntermediateDirectories: true)
try FileManager.default.createDirectory(atPath: artifactRoot,
                                        withIntermediateDirectories: true)

try AppStore(logRoot: logRoot,
             artifactRoot: artifactRoot)
.build()
