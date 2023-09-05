#!/usr/bin/env bash

######################################################################
# @author      : vng (vng@$HOSTNAME)
# @file        : setup_kotlin
# @created     : Tuesday Sep 05, 2023 12:08:18 EDT
#
# @description : Setup your kotlin.  Manual is for monkeys.
######################################################################
#
#
# shellcheck disable=SC2059

# Use "set -x" to echo commands to stdout with variable expansion
#set -x

brew reinstall -f jenv

# jenv doesn't bother to create it's own work directory
mkdir  -p ~/.jenv/versions

brew reinstall -f openjdk@17

jenv add /Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home

{
printf '\n\n#############################'
printf '\n### setup_kotlin.sh additions below'
printf '\n#############################\n\n\n'

echo '# Setup jenv'
printf "eval \"\$(jenv init -)\""
printf "\njenv enable-plugin export"

printf '\n\n# Make OpenJDK the first on the path\n'
echo "export PATH=\"/opt/homebrew/opt/openjdk@17/bin:$PATH\""

printf '\n# For compilers to find openjdk@17 you may need to set:'
printf '\nexport CPPFLAGS="-I/opt/homebrew/opt/openjdk@17/include"'
} >> ~/.zshrc

echo "Quit all your terminal windows to make sure you get the new shell config."
