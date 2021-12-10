#!/bin/bash
set -euo pipefail

cp gitconfig $HOME/.gitconfig
cp gitignore $HOME/.gitignore

git config --global user.name "Kashav Madan"
git config --global user.email "kshvmdn@gmail.com"

cat <<EOF
Setup signing key stuff: https://docs.github.com/en/authentication/managing-commit-signature-verification,
then run:

git config --global user.signingkey A1B2C3E4
git config --global gpg.program gpg
git config --global commit.gpgsign true
EOF
