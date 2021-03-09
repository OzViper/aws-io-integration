#!/bin/bash
set -e

source "$(dirname "$0")/scripts/preValidation.sh"
source "$(dirname "$0")/scripts/ioPrescription.sh"
source "$(dirname "$0")/scripts/runWorkflowEngineClient.sh"

preValidation;

if [[ "$STAGE" == "IO" ]]; then
    ioPrescription;
elif [[ "$STAGE" == "WORKFLOW" ]]; then
    runWorkflowEngineClient;
fi
