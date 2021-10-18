#!/bin/bash

if [[ "${JENKINS_MASTER_URL}" == "UNSET" ]]; then
  echo "Jenkins Agent URL was unset.. Please set this to your Jenkins server e.g. https://jenkins.example.com/"
  exit 1
fi

curl -o /tmp/agent.jar ${JENKINS_MASTER_URL}/jnlpJars/agent.jar
chmod 600 /tmp/agent.jar

java -jar /tmp/agent.jar -jnlpUrl "${JENKINS_MASTER_URL}/computer/${JENKINS_NODE_NAME}/jenkins-agent.jnlp" -secret "${JENKINS_NODE_SECRET}"
