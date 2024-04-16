#!/usr/bin/env bash

set -eo pipefail

echo "checking if SourceMember has a record with MemberType = 'QuickActionDefinition'"
recordCount="$(sf data query -t -q "SELECT COUNT() FROM SourceMember WHERE MemberType = 'QuickActionDefinition'" --json \
    | node -pe 'JSON.parse(fs.readFileSync(0, "utf8")).result.totalSize' )"
if [[ "${recordCount}" == "0" ]]; then
    echo "No SourceMember record with MemberType 'QuickActionDefinition' found. Thank you Salesforce for fixing the bug."
    exit 1
else
    echo "Found ${recordCount} SourceMember records with MemberType 'QuickActionDefinition'. Reproduction of the issue successful."
fi
