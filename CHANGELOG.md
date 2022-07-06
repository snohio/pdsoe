# pdsoe CHANGELOG

This file is used to list changes made in each version of the pdsoe cookbook.

## 1.2.0

- Added a feature to disable and reenable Defender (will fail if not used - probably need guarded) around the install to improve install time
- Extended the time out to 2400 seconds because it was timing out in the real world on 2 CPU 4gb machines.
- Added a log line before the install warning of long run times.

## 1.1.0

- Update to separate install into its own recipe.
- Initial Configuration for Upgrade Recipe - triggered by tags

## 1.0.0

Release One for Portfolio+ Demonstration

- Downloads and installs OpenEdge from Azure Web Storage
- Validates that the install is complete

## 0.1.0

Initial release.

- installs Chocolatey
- installs OpenJDK (Latest Version)
