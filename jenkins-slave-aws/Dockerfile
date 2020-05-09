FROM sktan/jenkins-slave:latest

# Setup base requirements
RUN amazon-linux-extras install epel && \
    yum install -y python3 python3-pip npm jq

# Install AWS tools (awscli, boto3 and serverless)
RUN pip3 install boto3 awscli && npm install -g serverless
