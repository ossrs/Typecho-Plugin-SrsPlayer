#!/bin/bash

REALPATH=$(realpath $0)
WORK_DIR=$(cd $(dirname $REALPATH)/.. && pwd)
echo "Run pub at $WORK_DIR from $0"
cd $WORK_DIR

git st |grep -q 'nothing to commit'
if [[ $? -ne 0 ]]; then
  echo "Failed: Please commit before release";
  exit 1
fi

RELEASE=$(git describe --tags --abbrev=0 --exclude release-*)
REVISION=$(echo $RELEASE|awk -F . '{print $3}')
let NEXT=$REVISION+1
echo "Last release is $RELEASE, revision is $REVISION, next is $NEXT"

VERSION="1.0.$NEXT" &&
TAG="v$VERSION" &&
echo "publish VERSION=$VERSION, TAG=$TAG"

cat SrsPlayer/Plugin.php |sed "s/version 1.*/version $VERSION/g" > tmp.txt && mv tmp.txt SrsPlayer/SrsPlayer.php &&
cat SrsPlayer/Plugin.php |sed "s/define( 'SRS_PLAYER_VERSION', '1.*/define( 'SRS_PLAYER_VERSION', '$VERSION' );/g" > tmp.txt && mv tmp.txt SrsPlayer/Plugin.php
if [[ $? -ne 0 ]]; then echo "Change release failed"; exit 1; fi

git ci -am "Update SrsPlayer version to $TAG"
if [[ $? -ne 0 ]]; then echo "Commit release failed"; exit 1; fi

git push
git tag -d $TAG 2>/dev/null && git push origin :$TAG
git tag $TAG
git push origin $TAG
echo "publish $TAG ok"
echo "    https://github.com/ossrs/Typecho-Plugin-SrsPlayer/actions"
