#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Start: From https://hub.docker.com/_/ibmjava: Java-8 + Ubuntu:20.04
FROM ubuntu:20.04

RUN apt-get update \
	&& apt-get install -y --no-install-recommends wget ca-certificates

ENV JAVA_VERSION 8.0.8.30

RUN set -eux; \
	ARCH="$(dpkg --print-architecture)"; \
	case "${ARCH}" in \
	amd64|x86_64) \
	ESUM='c93cb839cb6e8a082ecaddd43a5736bb33784ff578adf743a3970b418113655b'; \
	YML_FILE='8.0/sdk/linux/x86_64/index.yml'; \
	;; \
	ppc64el|ppc64le) \
	ESUM='85fb7353a7d5ac486d9f9843bc4968c6fd1f989adcbc214bb35191842e90db7f'; \
	YML_FILE='8.0/sdk/linux/ppc64le/index.yml'; \
	;; \
	s390) \
	ESUM='1acec5687144529687057af8d40c37913b0bc22a09fa413aed0fd266bb4b979e'; \
	YML_FILE='8.0/sdk/linux/s390/index.yml'; \
	;; \
	s390x) \
	ESUM='ff575513c14515bc1fc281152ff4702540e63028c4c8900abb6df98f9ce2d1ec'; \
	YML_FILE='8.0/sdk/linux/s390x/index.yml'; \
	;; \
	*) \
	echo "Unsupported arch: ${ARCH}"; \
	exit 1; \
	;; \
	esac; \
	BASE_URL="https://public.dhe.ibm.com/ibmdl/export/pub/systems/cloud/runtimes/java/meta/"; \
	wget -q -U UA_IBM_JAVA_Docker -O /tmp/index.yml ${BASE_URL}/${YML_FILE}; \
	JAVA_URL=$(sed -n '/^'${JAVA_VERSION}:'/{n;s/\s*uri:\s//p}'< /tmp/index.yml); \
	wget -q -U UA_IBM_JAVA_Docker -O /tmp/ibm-java.tgz ${JAVA_URL}; \
	echo "${ESUM}  /tmp/ibm-java.tgz" | sha256sum -c -; \
	mkdir -p /opt/ibm/java; \
	tar -xf /tmp/ibm-java.tgz -C /opt/ibm/java --strip-components=1; \
	rm -f /tmp/index.yml; \
	rm -f /tmp/ibm-java.tgz;

ENV JAVA_HOME=/opt/ibm/java/jre \
	PATH=/opt/ibm/java/bin:$PATH \
	IBM_JAVA_OPTIONS="-XX:+UseContainerSupport"

# End: From https://hub.docker.com/_/ibmjava: Java-8 + Ubuntu:20.04

# Install packages
RUN apt-get install python3 -y \ 
	&& apt-get install maven -y  \
	&& apt-get install unzip -y \
	&& 	apt-get install python3-setuptools -y \
	&& apt-get install python3-dev -y

# Core
ENV APP_HOME=/home/app
WORKDIR $APP_HOME

ENV pygradle_repo=$APP_HOME/.gradle/pygradle-repo
ENV workspace=$APP_HOME/Workspaces
ENV gradle_home=$APP_HOME/Tools/gradle

RUN mkdir -p $workspace \
	&& mkdir -p $gradle_home \
	&& mkdir -p $pygradle_repo

# Download gradle 5.0
RUN wget https://services.gradle.org/distributions/gradle-5.0-bin.zip -P $gradle_home \
	&& unzip $gradle_home/gradle-5.0-bin.zip -d $gradle_home \
	&& rm -f $gradle_home/gradle-5.0-bin.zip

# (1) Download & Build pivy-importer 
RUN wget https://github.com/linkedin/pygradle/archive/refs/heads/master.zip -O $workspace/pygr_master.zip \
	&& unzip $workspace/pygr_master.zip -d $workspace \
	&& rm -f $workspace/pygr_master.zip \
	&& $gradle_home/gradle-5.0/bin/gradle build -b $workspace/pygradle-master/pivy-importer/build.gradle

# (2) Download necessary Modules & Ivy files using pivy-importer
## (2.1) Copy scripts
COPY scripts $workspace/pygradle_python3_example/scripts

## (2.2) Run downloader script
RUN bash $workspace/pygradle_python3_example/scripts/downloadPyGradleDependencies.sh $pygradle_repo $workspace $JAVA_HOME \
	&& bash $workspace/pygradle_python3_example/scripts/fixDownloadedIvyModules.sh $pygradle_repo

# (4) Build pygradle_python3_example
COPY . $workspace/pygradle_python3_example/

RUN $gradle_home/gradle-5.0/bin/gradle -D home.location=$APP_HOME -D python.version=$(python3 -V | sed -e 's,.*\(3\.[[:digit:]]*\)\(\.[[:digit:]]*\),\1,g') build -b $workspace/pygradle_python3_example/build.gradle \
	&& echo "Build Success!"

ENTRYPOINT echo done