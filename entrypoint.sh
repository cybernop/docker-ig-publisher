#!/bin/bash

curr=$(pwd)

./_updatePublisher.sh -y
chmod a+x _genonce.sh
sed -i 's/bash/sh/g' _genonce.sh

java -jar plantuml.jar -tsvg -o $1/input/images $1/input/images-source

cd $1
/usr/share/ig/_genonce.sh
cd $curr
