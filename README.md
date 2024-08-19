# py_gradle_python3_example project

# Example Python-3 project built using PyGradle on Ubuntu 20.04, with Gradle-5.0 & Java-8.

#-- Requirements & Environment ---
# Python-3.8, Git2.+, Java-8, Gradle-5.0, PyGradle, Groovy-2.4

# Location of various modules & utilities, update these values accordingly if
## Java 			=> 	~/Tools/jdk1.8.0_151
## Gradle-5.0 			=> 	~/Tools/gradle/gradle-5.0
## Downloaded pygradle repo	=> 	~/.gradle/pygradle-repo/
## Downloads from git 		=>	~/Workspaces/	 

#--- Start ---
export JAVA_HOME=~/Tools/jdk1.8.0_151

## (1) Download & build pivy-importer
cd ~/Workspaces/
git clone https://github.com/linkedin/pygradle.git

cd pygradle/pivy-importer
~/Tools/gradle/gradle-5.0/bin/gradle build

## (2) Download all the necessary modules & ivy using pivy-importer
### (2.1) Download pygradle_python3_example
cd ~/Workspaces/
git clone https://github.com/alghoshal/pygradle_python3_example.git

### (2.2) Run the downloaded script downloadPyGradleDependecies.sh
bash ~/Workspaces/pygradle_python3_example/scripts/downloadPyGradleDependecies.sh

## (3) Fix issues with downloaded modules - issues with name, case, underscore, suffix, etc.
bash ~/Workspaces/pygradle_python3_example/scripts/fixDownloadedIvyModules.sh

## (4) Finally, build pygradle_python3_example 
cd ~/Workspaces/pygradle_python3_example
~/Tools/gradle/gradle-5.0/bin/gradle build

# End goal: A successful build using pygradle on Python-3! 

#--- Finish ---
