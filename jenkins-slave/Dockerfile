FROM amazoncorretto:8

ENV JENKINS_BASE /opt/jenkins
ENV JENKINS_HOME /var/lib/jenkins
ENV JENKINS_TZ Australia/Sydney

# Setup base requirements
RUN yum install openssh-server openssh-client git wget -y && \
    for KEYTYPE in rsa dsa ecdsa ed25519; do ssh-keygen -q -f "/etc/ssh/ssh_host_${KEYTYPE}_key" -N '' -t "$KEYTYPE" ; done

# Creates Jenkins user
RUN adduser --home ${JENKINS_HOME} jenkins && \
    echo jenkins:jenkins | chpasswd && \
    mkdir -p ${JENKINS_BASE} && mkdir -p ${JENKINS_HOME} && \
    chown jenkins:jenkins ${JENKINS_BASE} && chown jenkins:jenkins ${JENKINS_HOME}

EXPOSE 22
WORKDIR ${JENKINS_HOME}
VOLUME ${JENKINS_HOME}

CMD ["/usr/sbin/sshd", "-D"]
