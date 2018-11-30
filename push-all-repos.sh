#!/usr/bin/env bash

# A gerrit script to push all repositories from a manifest

# This again, will have to be adapted based on your setup.

cwd=$PWD
cd ~/aex2
PROJECTS="$(grep 'aex' .repo/manifests/snippets/aex.xml  | awk '{print $2}' | awk -F'"' '{print $2}' | uniq | grep -v caf)"
for project in ${PROJECTS}
do
    cd $project
    echo $project
    git push -o skip-validation $(git remote -v | head -1 | awk '{print $2}' | sed -e 's/https:\/\/github.com\/AospExtended/ssh:\/\/ishubhamsingh@gerrit.aospextended.com:29418\/AospExtended/') HEAD:refs/heads/9.x
    cd -
done
cd $cwd
