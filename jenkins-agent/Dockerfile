FROM amazoncorretto:8

# Environment Variables
ENV JENKINS_HOME /var/lib/jenkins
ENV JENKINS_MASTER_URL UNSET
ENV JENKINS_NODE_NAME jenkins-remote-agent
env JENKINS_NODE_SECRET "@/run/secrets/jenkins-remote-agent-secret"

# Setup base requirements
RUN yum install git curl python3 python3-pip -y

# Setup Jenkins user and scripts
RUN adduser --home ${JENKINS_HOME} jenkins
ADD --chown=jenkins:jenkins scripts /opt/jenkins-scripts
RUN chmod 700 /opt/jenkins-scripts/jenkins.sh && mkdir -p /remoting && chown jenkins:jenkins /remoting

USER jenkins
WORKDIR $JENKINS_HOME

ENTRYPOINT ["/opt/jenkins-scripts/jenkins.sh"]
