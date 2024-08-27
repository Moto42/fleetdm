#!/bin/sh

bothfilesexist(){
  if ls /certsvolume/cert.pem && ls /certsvolume/key.pem;
  then
    return 0
  else
    return 1
  fi
}

if bothfilesexist; then
  echo "################\nAll certs exist\n################"
  exit 0
else
  echo "##########\nSome or all certs not found\n(re)generating certs\n##########"
  rm /certs/*
  /usr/local/bin/generate-certs || exit 1
  mv /certs/cert.pem /certsvolume/cert.pem
  mv /certs/key.pem /certsvolume/key.pem
fi