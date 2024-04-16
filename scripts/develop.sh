#!/usr/bin/env bash

set -eo pipefail

sf org create scratch -f config/project-scratch-def.json -a mre-incorrect-source-member-type-quickactiondefinition -d
sf project deploy start
