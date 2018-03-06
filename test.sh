#!/bin/bash

set -u

echo -n 'Common password … '
RESULT=$(./pwned <<< 'test')
EXIT=$?
if [ $EXIT -eq 0 ]; then
    echo 'FAILED'
    exit 1
fi
if [[ "${RESULT}" != *'Oh no - pwned!'* ]]; then
    echo 'FAILED'
    exit 1
fi
echo 'PASSED'

echo -n '"Good" password … '
RESULT=$(./pwned <<< 'fahMoo7ahtaGieb4eeY5aiphai0Poogh2ri3aifaequei9aeja0mug0eeyie9uog')  # Of course this breaks if someone adds those random bits…
EXIT=$?
if [ $EXIT -ne 0 ]; then
    echo 'FAILED'
    exit 1
fi
if [[ "${RESULT}" != *'not pwned'* ]]; then
    echo 'FAILED'
    exit 1
fi
echo 'PASSED'
