#!/bin/bash
# Credits: Marvin Frommhold http://depressiverobot.com/2015/01/05/git-email.html
# License: CC-BY-NC 4.0 https://creativecommons.org/licenses/by-nc/4.0/

# bash prompt which asks for email address
# to configure for current git repository

i=0
IFS=' ' read -ra MAILS <<< $(git config user.emails)

if [[ "$MAILS" == "" ]]
then
  echo "No default mail addresses provided. You can set them using:"
  echo "  git config --global user.emails \"mail1@example.org mail2@example.org ...\""
  echo -n "email: "
  read email

  # abort when pressing enter
  if [[ "$email" == "" ]]
  then
    echo "$(tput setaf 3)abort$(tput sgr 0): No email set."
    exit 0
  fi

  git config user.email $email
  echo "Set '$email' as email address for this repository."
  exit 0
fi

# prompt for email
echo "Which email address should be configured for this repository?"
echo "Press [Enter] to abort..."
for ((i = 0; i < ${#MAILS[*]}; i++))
do
  echo "$(tput bold)$(($i + 1))$(tput sgr 0): ${MAILS[$i]}"
done
echo
echo -n "email: "
read -n 1 email
echo
echo

# abort when pressing enter
if [[ "$email" == "" ]]
then
  echo "$(tput setaf 3)abort$(tput sgr 0): No email set."
  exit 0
fi

# error if entered number is less than 1 or greater than size of emails
if [[ $email -lt "1" || $email -gt ${#MAILS[*]} ]]
then
  echo "$(tput setaf 1)error$(tput sgr 0): Unknown email $(tput bold)$email$(tput sgr 0)"
  exit 1
fi

# set email
echo "Set '${MAILS[$(($email - 1))]}' as email address for this repository."
git config user.email ${MAILS[$(($email - 1))]}

exit 0
