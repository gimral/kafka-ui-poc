FROM centos:7 AS builder

ENV CC_VERSION=2.0.57
ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk

RUN yum -y install git java-1.8.0-openjdk-devel

RUN git clone --branch ${CC_VERSION} https://github.com/linkedin/cruise-control.git

WORKDIR cruise-control

# Compile and remove leftover directories
RUN ./gradlew jar :cruise-control:jar  \
    && rm -rf cruise-control-core cruise-control-metrics-reporter cruise-control-client

# Configure Cruise Control to point to the proper Kafka and Zookeeper endpoints
RUN sed -i 's/bootstrap.servers=.*/bootstrap.servers=my-cluster-kafka-bootstrap:9092/g' config/cruisecontrol.properties \
    && sed -i 's/zookeeper.connect=.*/zookeeper.connect=zoo-entrance:2181/g' config/cruisecontrol.properties \
    && sed -i 's/capacity.config.file=.*/capacity.config.file=config\/capacityJBOD.json/g' config/cruisecontrol.properties \
    && sed -i 's/sample.store.topic.replication.factor=.*/sample.store.topic.replication.factor=1/g' config/cruisecontrol.properties

# Install Cruise Control GUI Frontend
RUN curl -L https://github.com/linkedin/cruise-control-ui/releases/download/v0.1.0/cruise-control-ui.tar.gz \
    -o /tmp/cruise-control-ui.tar.gz \
    && tar zxvf /tmp/cruise-control-ui.tar.gz

# --------------- Final stage ---------------
FROM centos:7
WORKDIR cruise-control

RUN yum -y install java-1.8.0-openjdk && \
    yum clean all -y

COPY --from=builder cruise-control .

# Ensure Cruise Control writable for logs
RUN chmod a+rw -R .

ENTRYPOINT ["/bin/bash", "-c", "./kafka-cruise-control-start.sh config/cruisecontrol.properties"]