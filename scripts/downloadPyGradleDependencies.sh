#!/bin/bash


pygradle_repo=~/.gradle/pygradle-repo
workspace=~/Workspaces
JAVA_HOME=~/Tools/jdk1.8.0_151

if [ $# -eq 3 ]
then
	pygradle_repo=$1
	workspace=$2
	JAVA_HOME=$3
fi

export JAVA_HOME=$JAVA_HOME
mkdir -p $pygradle_repo/

# Download jars
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ alabaster:0.7.1
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ atomicwrites:1.0.0
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ attrs:17.4.0
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ babel:1.3
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ certifi:2017.4.17
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ chardet:2.3.0
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ colorama:0.3.5
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ configparser:3.5.0
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ coverage:4.4
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ docutils:0.11
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ execnet:1.1
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ flake8:3.6.0
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ funcsigs:1.0.2
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ idna:2.5
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ imagesize:1.4.1
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ Jinja2:2.3
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ mccabe:0.6.0
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ more-itertools:4.0.0
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ ordereddict:1.1
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ packaging:19.2
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ pathlib2:2.2.0
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ pip:18.1
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ pluggy:0.7.1
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ py:1.11.0
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ pycodestyle:2.4.0
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ pyflakes:2.0.0
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ Pygments:2.0
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ pyparsing:2.1.9
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ pytest:3.10.0
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ pytest-cov:2.6.0
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ pytest-forked:1.6.0
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ pytest-xdist:1.24.0
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ python-dateutil:2.6.0
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ pytz:2016.4
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ requests:2.0.0
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ requests:2.20.0
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ scandir:1.10.0
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ setuptools:45.2.0
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ setuptools-git:1.2
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ six:1.16.0
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ snowballstemmer:1.1.0
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ Sphinx:1.8.1
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ sphinxcontrib-websupport:1.1.2
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ typing:3.5.2
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ urllib3:1.21.1
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ virtualenv:16.0.0
$JAVA_HOME/bin/java -jar $workspace/pygradle-master/build/pivy-importer/libs/pivy-importer-0.12.11-SNAPSHOT-all.jar --repo $pygradle_repo/ wheel:0.31.1
