#!/bin/bash
firstline=$(head -n 1 source/changelog.md)

read -a splitfirstline <<< $firstline

version=${splitfirstline[1]}
echo 'Do you want to continue? (enter "1" for yes, "0" for no)'

read versioncontinue

if [ $versioncontinue -eq 1 ]
then
  echo "OK"
  for filename in source/*
  do
    echo $filename
  done
else
  echo "Please come back when you are ready"
fi

echo "You are building version" $version
echo "Hello there!!!"

if [ "$filename" == "source/secretinfo.md" ]
then
  echo "Not copying" $filename
else
  echo "Copying" $filename
  cp $filename build/.
fi

cd build/

cd ..

echo "Build version $version contains:"
ls




