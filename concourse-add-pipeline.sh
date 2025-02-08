#!/bin/bash

fly --target pine login --team-name main --concourse-url http://localhost:8083 -u pine -p pine
fly --target pine destroy-pipeline --pipeline concourse-dev
fly --target pine set-pipeline --pipeline concourse-dev --config ./ci/concourse/pipeline.yml --load-vars-from ./ci/concourse/credentials.yml
fly --target pine unpause-pipeline --pipeline concourse-dev