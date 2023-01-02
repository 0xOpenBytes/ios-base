# **Contributing**

When contributing to this repository, please first discuss the change you wish to make via issue,
Discord, or any other method with the other primary contributors of this repository before making a change.

## Pull Request Process

1. Ensure any install or build dependencies are removed before the end of the layer when doing a build.
2. Update the README.md with details of changes to the interface; this includes new environment variables, exposed ports, valid file locations and container parameters.
3. Increase the version numbers in any examples files and the README.md to the new version that this pull request would represent. The versioning scheme we use is [SemVer](http://semver.org/).
4. You may merge the pull request via a squash commit once you have a code review and approval of another developer, or if you do not have permission to do that, you may request the reviewer to merge it for you. Pull requests may not be merged without approval, passing checks/workflows or 
5. Please add the squash commit message as a bullet on the next draft release note.

## Issue Report Process

1. Go to the project's issues
2. Select the template that best fits your issue
3. Read the instructions carefully and write within the template guidelines
4. Submit for conversation

## Code Style Guidelines

Please see the project's [Swift guidelines](SWIFT_CODE_GUIDELINES.md) for more detailed information.

SwiftLint settings file should reflect the following:

```yaml
# By default, SwiftLint uses a set of sensible default rules you can adjust:
disabled_rules: # rule identifiers turned on by default to exclude from running
  - colon
  - comma
  - control_statement
opt_in_rules: # some rules are turned off by default, so you need to opt-in
  - empty_count # Find all the available rules by running: `swiftlint rules`

# Alternatively, specify all rules explicitly by uncommenting this option:
# only_rules: # delete `disabled_rules` & `opt_in_rules` if using this
#   - empty_parameters
#   - vertical_whitespace

included: # paths to include during linting. `--path` is ignored if present.
  - Source
excluded: # paths to ignore during linting. Takes precedence over `included`.
  - Carthage
  - Pods
  - Source/ExcludedFolder
  - Source/ExcludedFile.swift
  - Source/*/ExcludedFile.swift # Exclude files with a wildcard
analyzer_rules: # Rules run by `swiftlint analyze` (experimental)
  - explicit_self

# configurable rules can be customized from this configuration file
# binary rules can set their severity level
force_cast: warning # implicitly
force_try:
  severity: warning # explicitly
# rules that have both warning and error levels, can set just the warning level
# implicitly
line_length: 110
# they can set both implicitly with an array
type_body_length:
  - 300 # warning
  - 400 # error
# or they can set both explicitly
file_length:
  warning: 500
  error: 1200
# naming rules can set warnings/errors for min_length and max_length
# additionally they can set excluded names
type_name:
  min_length: 4 # only warning
  max_length: # warning and error
    warning: 40
    error: 50
  excluded: iPhone # excluded via string
  allowed_symbols: ["_"] # these are allowed in type names
identifier_name:
  min_length: # only min_length
    error: 4 # only error
  excluded: # excluded via string array
    - id
    - URL
    - GlobalAPIKey
reporter: "xcode" # reporter type (xcode, json, csv, checkstyle, codeclimate, junit, html, emoji, sonarqube, markdown, github-actions-logging)
```
