#!/bin/bash

# Read in password to check for known breach
echo -n "pwned?:"
read -s PASSWORD
echo

# calculate SHA-1 checksum for password
PWDSHASUM=$(printf %s "$PASSWORD" | shasum)

# split SHA-1 sum into prefix (for API call) and suffix
SHASUM_PREFIX=$(echo $PWDSHASUM | cut -c1-5 | awk '{print toupper($0)}')
SHASUM_SUFFIX=$(echo $PWDSHASUM | cut -c6-40 | awk '{print toupper($0)}')

# query HIBP API with prefix & check if suffix is in response
RESULT=$(curl -s https://api.pwnedpasswords.com/range/$SHASUM_PREFIX | grep $SHASUM_SUFFIX)

# check if suffix is in API response
if [ ${#RESULT} -ge 36 ]; then
  # extract occurence from result
  PWND_TIMES=$(echo $RESULT | cut -c37- | xargs)
  # remove last character
  printf "Oh no - pwned! This password has been seen several times: %s\n" "$PWND_TIMES"
  echo -n -e "\a"
  exit -1
else
  echo "Password not pwned - no guarantee that it is a good password."
fi
