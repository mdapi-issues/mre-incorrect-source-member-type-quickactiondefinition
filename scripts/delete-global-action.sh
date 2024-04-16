#!/usr/bin/env bash

set -eo pipefail

echo "Deleting QuickAction:NewGroup via Tooling API. This mimics the click in the UI."
recordId="$(sf data query --use-tooling-api -q "SELECT Id FROM QuickActionDefinition WHERE DeveloperName = 'NewGroup'" --json \
    | node -pe 'JSON.parse(fs.readFileSync(0, "utf8")).result.records[0].Id')"
sf data record delete --use-tooling-api -s QuickActionDefinition -i "${recordId}"
