#!/bin/bash
igdir="/usr/share/ig"
curr=$(pwd)

cd $igdir
java -jar plantuml.jar -tsvg -o $1/input/images $1/input/images-source

cd $1
$igdir/_updatePublisher.sh -y
chmod a+x $igdir/_genonce.sh
$igdir/_genonce.sh
cd $curr
