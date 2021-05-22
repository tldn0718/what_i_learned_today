#!/bin/bash
echo "Moving files from source to build except for credential files."
firstline=$(head -n 1 ./source/changelog.md)
read -a splitfirstline <<< "$firstline"
version=${splitfirstline[1]}
echo "$version"

echo "Continue? (1 for yes, 0 for no)"
read versioncontinue
if [ "$versioncontinue" == "1" ]
then
  echo "OK"
  files=./source/*
  for file in $files
  do
    if [ "$file" == "./source/secretinfo.md" ]
    then
      echo "$file is not copied."
    else
      cp "$file" ./build
      echo "$file is copied to ./build"
    fi
  done
  ls
else
  echo "Please come back when you are ready"
fi

