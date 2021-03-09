function ioPrescription() {
    $(`wget https://sigdevsecops.blob.core.windows.net/intelligence-orchestration/${WORKFLOW_ENGINE_VERSION}/prescription.sh`)

    chmod +x prescription.sh
    sed -i -e 's/\r$//' prescription.sh

    echo "SENSITIVE_PACKAGE_PATTERN"
    echo $SENSITIVE_PACKAGE_PATTERN

    # fixme - if something goes wrong here!?
    ./prescription.sh \
        --io.url=${IO_SERVER_URL} \
        --io.token=${IO_ACCESS_TOKEN} \
        --io.manifest.url=${IO_MANIFEST_URL} \
        --asset.id=${BITBUCKET_REPO_FULL_NAME} \
        --release.type=${RELEASE_TYPE} \
        --sensitive.package.pattern=${SENSITIVE_PACKAGE_PATTERN} \
        --scm.type="bitbucket" \
        --workflow.url=${WORKFLOW_ENGINE_SERVER_URL} \
        --workflow.version=${WORKFLOW_ENGINE_VERSION} \
        --polaris.project.name=${POLARIS_PROJECT_NAME} \
        --polaris.url=${POLARIS_SERVER_URL} \
        --polaris.token=${POLARIS_ACCESS_TOKEN} \
        --blackduck.project.name=${BLACKDUCK_PROJECT_NAME} \
        --blackduck.url=${BLACKDUCK_SERVER_URL} \
        --blackduck.api.token=${BLACKDUCK_ACCESS_TOKEN} \
        --scm.owner=${BITBUCKET_WORKSPACE} \
        --scm.repo.name=${BITBUCKET_REPO_SLUG} \
        --scm.branch.name=${BITBUCKET_BRANCH} \
        --bitbucket.commit.id=${BITBUCKET_COMMIT} \
        --bitbucket.username=${BITBUCKET_USERNAME} \
        --bitbucket.password=${BITBUCKET_ACCESS_TOKEN} \
        --jira.api.url=${JIRA_API_URL} \
        --jira.project.name=${JIRA_PROJECT_NAME} \
        --jira.issues.query=${JIRA_ISSUES_QUERY} \
        --jira.username=${JIRA_USERNAME} \
        --jira.auth.token=${JIRA_AUTH_TOKEN} \
        --jira.assignee=${JIRA_ASSIGNEE} \
        --IS_SAST_ENABLED=true \
        --IS_SCA_ENABLED=true \
        --slack.channel.id=${SLACK_CHANNEL_ID} \
        --slack.token=${SLACK_TOKEN} \
        --stage=${STAGE} \
        --persona=${PERSONA} \
        ${additionalWorkflowArgs}

    isSastEnabled=$(ruby -rjson -e 'j = JSON.parse(File.read("result.json")); puts j["security"]["activities"]["sast"]["enabled"]')
    isScaEnabled=$(ruby -rjson -e 'j = JSON.parse(File.read("result.json")); puts j["security"]["activities"]["sca"]["enabled"]')
    echo "IS_SAST_ENABLED=${isSastEnabled}" > pipe.meta.env
    echo "IS_SCA_ENABLED=${isScaEnabled}" >> pipe.meta.env
}