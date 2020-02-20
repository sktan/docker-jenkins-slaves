FROM sktan/jenkins-slave:latest

# Setup base requirements
RUN yum install -y python3 python3-pip npm

# Install language framework requirements
RUN pip3 install boto3 awscli && npm install -g serverless
