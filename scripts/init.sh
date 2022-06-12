#! /bin/bash

DIR="/media/stanley"
CREDS="$(pwd)/.smbcredentials"

echo "Checking for sudo privileges now..."
sudo echo ""

if [ ! -d "$DIR" ]; then
  echo "${DIR} not found. Creating now..."
  mkdir $DIR
  echo "Folder created."
fi

if [ ! -f "$CREDS" ]; then
  echo "${CREDS} not found. Creating now..."
  echo -ne "username=USERNAME" >> $CREDS
  echo -ne "password=PASSWORD" >> $CREDS
  echo "Credentials file created."
  echo "Please remember to change the credentials."
fi

sudo mount -t cifs -o rw,vers=3.0,credentials=$CREDS //10.1.2.1/stanley $DIR
files=$(shopt -s nullglob dotglob; echo $DIR/*)
if (( ${#files} )); then
  echo "SMB connection successful."
else
  echo "SMB connection UNSUCCESSFUL."
  echo "Please check your credentials and/or connection."
fi
