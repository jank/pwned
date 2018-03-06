[![Build Status](https://travis-ci.org/BY-jk/pwned.svg?branch=master)](https://travis-ci.org/BY-jk/pwned)

# pwned
A simple bash script to securely check for pwned passwords using the pwnedpasswords.com range API.

Want to check from your local shell if a password as been pawned in a secure way? Look no further, just download pwned and run it from you local shell.

All credits go to @troyhunt (https://haveibeenpwned.com) for providing the API for securely checking if a password has been part of a breach.

Usage:

* copy to local computer
* make file executable (chmod +x pwned)
* run './pwned'
* enter password when prompted

This shell script comes bare bones.

* assumes a working internet connection
* does not handle any error cases

But, it does not expose your password to the API. Rather, it uses the range API, just sending the first five characters of the SHA-1 sum.
