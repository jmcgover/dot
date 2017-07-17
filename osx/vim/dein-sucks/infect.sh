#! /bin/env sh

DEIN_INSTALLER="https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh"
DEIN_INSTALLER_NAME="dein-installer.sh"
DEIN_INSTALL_LOC="${HOME}/.vim/bundles"

echo "INSTALLING DEIN USING" ${DEIN_INSTALLER}
curl ${DEIN_INSTALLER} > ${DEIN_INSTALLER_NAME} 

echo "RUNNING" ${DEIN_INSTALLER_NAME}
echo "INSTALL DIRECTORY:" ${DEIN_INSTALL_LOC}
sh ./${DEIN_INSTALLER_NAME} ${DEIN_INSTALL_LOC}

CUR_DIR=$(pwd)

echo Changing from ${CUR_DIR} to ${HOME}
cd ${HOME}
pwd
ln -sv "${CUR_DIR}/vimrc" .vimrc
cd ${CUR_DIR}

exit 0
