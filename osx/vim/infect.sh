#! /bin/env sh

DEIN_INSTALLER="https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh"
DEIN_INSTALLER_NAME="dein-installer.sh"
DEIN_INSTALL_LOC="${HOME}/.vim/dein/repos/github.com/Shougo/dein.vim"

echo "INSTALLING DEIN USING" ${DEIN_INSTALLER}
curl ${DEIN_INSTALLER} > ${DEIN_INSTALLER_NAME} 

echo "RUNNING" ${DEIN_INSTALLER_NAME}
echo "INSTALL DIRECTORY:" ${DEIN_INSTALL_LOC}
sh ./${DEIN_INSTALLER_NAME} ${DEIN_INSTALL_LOC}

exit 0
