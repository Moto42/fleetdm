#!/bin/sh

bothfilesexist(){
  if ls /certsvolume/cert.pem >/dev/null && ls /certsvolume/key.pem>/dev/null;
  then
    return 0
  else
    return 1
  fi
}

if bothfilesexist; then
  printf "################\nAll certs exist\n################"
  exit 0
else
  printf "##########\nSome or all certs not found\n(re)generating certs\n##########"
  rm /certs/* >/dev/null
  /usr/local/bin/generate-certs >/dev/null || exit 1
  mv /certs/cert.pem /certsvolume/cert.pem >/dev/null
  mv /certs/key.pem /certsvolume/key.pem >/dev/null
fi