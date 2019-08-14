#! /usr/bin/env sh

# vundle (cause dein sucks)
vundleRepo="https://github.com/VundleVim/Vundle.vim.git"
vundleTarget="${HOME}/.vim/bundle/Vundle.vim"

echo "INSTALLING vundle"
git clone ${vundleRepo} ${vundleTarget}

errno=$?
if [ ${errno} != "0" ]; then
    (>&2 echo "Received error:" ${errno})
    (>&2 echo "Exiting")
    exit ${errno}
fi

# vimrc
echo "INSTALLING vimrc"
currentDirectory=$(pwd)
echo Changing from ${currentDirectory} to ${HOME}
cd ${HOME}
pwd
ln -sv "${currentDirectory}/vimrc" .vimrc
cd ${currentDirectory}

# Plugins
echo "INSTALLING plugins"
vim -c 'PluginInstall' -c 'qa!' << EOF

EOF

echo "DONE"
exit 0
