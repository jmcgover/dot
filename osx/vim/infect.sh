#! /bin/env sh

VUNDLE_REPO=

CUR_DIR=$(pwd)

echo Changing from ${CUR_DIR} to ${HOME}
cd ${HOME}
pwd
ln -sv "${CUR_DIR}/vimrc" .vimrc
cd ${CUR_DIR}

exit 0
