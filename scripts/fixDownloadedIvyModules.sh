#!/bin/bash

pygradle_repo=~/.gradle/pygradle-repo

if [ $# -eq 1 ]
then
	pygradle_repo=$1
fi

## (3) Fixes issues with downloaded modules & Ivy files - sphinxcontrib-websupport-1.1.2, Babel-1.3, typing-3.5.2 & flake8-3.6.0

### (3.1) Fix sphinxcontrib-websupport - name contains '-', replace with '_'
ln -s $pygradle_repo/pypi/sphinxcontrib-websupport/1.1.2 $pygradle_repo/pypi/sphinxcontrib_websupport/1.1.2
ln -s $pygradle_repo/pypi/sphinxcontrib-websupport/1.1.2/sphinxcontrib-websupport-1.1.2.tar.gz $pygradle_repo/pypi/sphinxcontrib_websupport/1.1.2/sphinxcontrib_websupport-1.1.2.tar.gz
cp -s $pygradle_repo/pypi/sphinxcontrib-websupport/1.1.2/sphinxcontrib-websupport-1.1.2.ivy $pygradle_repo/pypi/sphinxcontrib_websupport/1.1.2/sphinxcontrib_websupport-1.1.2.ivy

# Fix the module name in the ivy file
sed -ie 's,sphinxcontrib-websupport,sphinxcontrib_websupport,g' $pygradle_repo/pypi/sphinxcontrib_websupport/1.1.2/sphinxcontrib_websupport-1.1.2.ivy

### (3.2) Fix Babel-1.3, name in upper case 'Babel', replace with 'babel'
ln -s $pygradle_repo/pypi/Babel $pygradle_repo/pypi/babel
ln -s $pygradle_repo/pypi/Babel/1.3/Babel-1.3.tar.gz $pygradle_repo/pypi/babel/1.3/babel-1.3.tar.gz
cp -s $pygradle_repo/pypi/Babel/1.3/Babel-1.3.ivy $pygradle_repo/pypi/babel/1.3/babel-1.3.ivy

# Fix the module name in the ivy file
sed -ie 's,Babel,babel,g' $pygradle_repo/pypi/babel/1.3/babel-1.3.ivy

### (3.3) Fix typing-3.5.2, add link to 'typing-3.5.2-2'
ln -s $pygradle_repo/pypi/typing/3.5.2/typing-3.5.2.2.tar.gz $pygradle_repo/pypi/typing/3.5.2/typing-3.5.2-2.tar.gz

### (3.4) Remove dependency on module 'enum34' from flake8-3.6.0.ivy
sed -ie 's,<dependency org="pypi" name="enum34" rev="1.1.10" conf="default" />,<!-- Removed dependency on enum34--> <!-- <dependency org="pypi" name="enum34" rev="1.1.10" conf="default" /> -->,g' $pygradle_repo/pypi/flake8/3.6.0/flake8-3.6.0.ivy

