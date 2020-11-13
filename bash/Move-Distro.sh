#!/bin/bash

distro=$1
if [ -z "$distro" ]; then
  echo "available distros"
  wsl.exe --list -v
  echo "choose one name"
  read -r -p 'distro: ' distro
  if [ -z "$distro" ]; then
    echo "invalid choice"
    exit 1
  fi
fi

wsl.exe --export "$distro" "/mnt/d/tmp/moving.tar"
wsl.exe --unregister "$distro"
wsl.exe --import "$distro" "/mnt/d/wls/ubuntu" "/mnt/d/tmp/moving.tar" --version 2
