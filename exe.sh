#!/usr/bin/bash
git add .
git commit -m "c"
git push 
git tag 0.0.10
git push --tag
pod spec lint YMADProj.podspec --verbose
