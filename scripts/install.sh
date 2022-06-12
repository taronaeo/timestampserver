#! /bin/bash

if ! command -v fnm &> /dev/null
then
  echo "Fast Node Manager not found. Installing..."
  curl -fsSL https://fnm.vercel.app/install | bash
  echo "Install complete."
  exit
else
  echo "Fast Node Manager found. Skipping install..."
fi

fnm install

echo "Full installation complete."