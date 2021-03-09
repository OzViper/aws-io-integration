function preValidation() {
    STAGE=${STAGE:?'STAGE variable missing.'};
    IO_SERVER_URL=${IO_SERVER_URL:="http://$BITBUCKET_DOCKER_HOST_INTERNAL:9090"};

    if [[ "$IO_SERVER_URL" == "http://$BITBUCKET_DOCKER_HOST_INTERNAL:9090" ]]; then
        sleep 30 # need to wait for io container to spin up
        # health check - todo: improve wait time logic
        healthCheck=$(curl $IO_SERVER_URL/actuator/health)
        ioSignUp=$(curl -X POST $IO_SERVER_URL/io/user/signup -H "Content-Type:application/json" -d "{\"userName\":\"user123\",\"password\":\"P@ssw0rd!\",\"confirmPassword\":\"P@ssw0rd!\"}")
        IO_ACCESS_TOKEN=$(curl -X POST $IO_SERVER_URL/io/user/token -H "Content-Type:application/json" -d "{\"userName\":\"user123\",\"password\":\"P@ssw0rd!\"}")
    fi

    IO_ACCESS_TOKEN=${IO_ACCESS_TOKEN:?'IO_ACCESS_TOKEN variable missing.'};
    WORKFLOW_ENGINE_SERVER_URL=${WORKFLOW_ENGINE_SERVER_URL:="http://$BITBUCKET_DOCKER_HOST_INTERNAL:9091"};
    WORKFLOW_ENGINE_VERSION=${WORKFLOW_ENGINE_VERSION:="2021.01"};
    RELEASE_TYPE=${RELEASE_TYPE:="minor"};
    JIRA_API_URL=${JIRA_API_URL:="<<JIRA_API_URL>>"};
    JIRA_PROJECT_NAME=${JIRA_PROJECT_NAME:="<<JIRA_PROJECT_NAME>>"};
    JIRA_ISSUES_QUERY=${JIRA_ISSUES_QUERY:="<<JIRA_ISSUES_QUERY>>"};
    JIRA_USERNAME=${JIRA_USERNAME:="<<JIRA_USERNAME>>"};
    JIRA_AUTH_TOKEN=${JIRA_AUTH_TOKEN:="<<JIRA_AUTH_TOKEN>>"};
    JIRA_ASSIGNEE=${JIRA_ASSIGNEE:="<<JIRA_ASSIGNEE>>"};
    
    additionalWorkflowArgs=${additionalWorkflowArgs:=""};
}
