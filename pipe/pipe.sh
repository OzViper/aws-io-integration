#!/bin/bash
set -e

source "$(dirname "$0")/utils/preValidation.sh"
source "$(dirname "$0")/utils/ioPrescription.sh"
source "$(dirname "$0")/utils/runWorkflowEngineClient.sh"

preValidation;

if [[ "$STAGE" == "IO" ]]; then
    ioPrescription;
elif [[ "$STAGE" == "WORKFLOW" ]]; then
    runWorkflowEngineClient;
fi
