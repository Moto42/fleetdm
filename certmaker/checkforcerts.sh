#!/bin/sh

bothfilesexist(){
  if ls /certs/cert.pem && ls /certs/key.pem;
  then
    return 0
  else
    return 1
  fi
}

if bothfilesexist; then
  echo "thinger"
  exit 0
else
  echo "thanger"
  rm /certs/*
  /usr/local/bin/generate-certs && exit 0 || exit 1
fi