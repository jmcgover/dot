#! /usr/bin/env bash

echoerr() {
    (>&2 echo $@)
}
changeDirectory() {
    echoerr "Changing to:" "$@"
    cd $@
    return $?
}
saveOld() {
    local BACK_SUFFIX=".backup"
    local curDate=$(date)

    local filename="$1"
    local backupName="${filename}${BACK_SUFFIX}"
    echoerr "${curDate}: Backing up ${filename} -> ${backupName}"
    echo "# BEGIN" ${curDate} >> ${backupName}
    cat ${filename} >> ${backupName}
    echo "# END" ${curDate} >> ${backupName}
}

# Directories
curDir="$(pwd)"
target="${HOME}"

# Change to target directory, the user's home
changeDirectory ${target}
if [[ "$?" == "0" ]]; then

    echoerr 
    echoerr Saving the content of the old configuration files...
    saveOld .bashrc
    saveOld .bash_profile

    echoerr 
    echoerr Linking the new configuration files, overwriting the old...
    ln -sfv "${curDir}/tmux.conf" .tmux.conf
else
    echoerr "Error ($?): Failed to change to target directory:" ${target}
fi

# Change back to dotfiles directory
echoerr 
changeDirectory ${curDir}

exit 0
