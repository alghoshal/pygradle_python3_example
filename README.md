# Example Python-3 project built using PyGradle on Ubuntu 20.04, with Gradle-5.0 & Java-8.

## Requirements & Environment
	Python-3.8+, Git2.+, Java-8, Gradle-5.0, PyGradle, Groovy-2.4

## Location of Modules, Utilities, Repository

	* Java                    	 ~/Tools/jdk1.8.0_151
	* Gradle-5.0              	 ~/Tools/gradle/gradle-5.0
	* Downloaded pygradle repo	 ~/.gradle/pygradle-repo/
	* Downloads from git       	 ~/Workspaces/

## --- Start ---
	JAVA_HOME=~/Tools/jdk1.8.0_151
	APP_HOME=~
	pygradle_repo=$APP_HOME/.gradle/pygradle-repo
	workspace=$APP_HOME/Workspaces
	gradle_home=$APP_HOME/Tools/gradle
	export JAVA_HOME=$JAVA_HOME
	
### (1) Download & Build pivy-importer
	RUN wget https://github.com/linkedin/pygradle/archive/refs/heads/master.zip -O $workspace/pygr_master.zip
		
	RUN unzip $workspace/pygr_master.zip -d $workspace
		
	RUN $gradle_home/gradle-5.0/bin/gradle build -b $workspace/pygradle-master/pivy-importer/build.gradle

### (2) Download necessary Modules & Ivy files using pivy-importer
#### (2.1) Download pygradle_python3_example
	RUN wget https://github.com/alghoshal/pygradle_python3_example/archive/refs/heads/main.zip -O $workspace/pygrexg_master.zip
	
	RUN unzip $workspace/pygrexg_master.zip -d $workspace

#### (2.2) Run downloader script
	bash $workspace/pygradle_python3_example/scripts/downloadPyGradleDependecies.sh

### (3) Fix downloaded modules - issues with name, case, underscore, suffix, etc.
	bash $workspace/pygradle_python3_example/scripts/fixDownloadedIvyModules.sh

### (4) Build pygradle_python3_example 
	$gradle_home/gradle-5.0/bin/gradle $workspace/pygradle_python3_example/build.gradle

## End goal: A successful build using pygradle on Python-3! 

## --- Finish ---
