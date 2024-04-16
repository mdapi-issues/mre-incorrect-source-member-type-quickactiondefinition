#!/usr/bin/env bash

set -eo pipefail

echo "Updating QuickAction:NewNote description via Tooling API. This mimics the the change in the UI."
recordId="$(sf data query --use-tooling-api -q "SELECT Id FROM QuickActionDefinition WHERE DeveloperName = 'NewNote'" --json \
    | node -pe 'JSON.parse(fs.readFileSync(0, "utf8")).result.records[0].Id')"
sf data record update --use-tooling-api -s QuickActionDefinition -i "${recordId}" -v "description='test description'"
