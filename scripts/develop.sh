#!/usr/bin/env bash

set -eo pipefail

sf org create scratch -f config/project-scratch-def.json -a mre-invalid-source-member-name -d
sf project deploy start
