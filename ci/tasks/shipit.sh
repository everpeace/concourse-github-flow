#!/bin/bash

VERSION=`cat version/version`
echo "Shipping ($VERSION)"

cd repo

# FIXME customize it!
# see: https://github.com/concourse/github-release-resource#example
echo $VERSION > ../release/name
echo $VERSION > ../release/tag
echo $(git rev-parse HEAD) > ../release/commitish
cat > ../release/notes.md <<EOF
This is version ${VERSION}!!
EOF

tar zcvf ../release/concourse-github-flow-${VERSION}.tgz ./*

cd ..
ls release
