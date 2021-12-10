#!/bin/bash
set -euo pipefail

cp bash_profile $HOME/.bash_profile
cp bashrc $HOME/.bashrc
cp -r bashrc.d/ $HOME/.bashrc.d/

cp inputrc $HOME/.inputrc
