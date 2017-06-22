#!/bin/bash

source _setenv_android.bash

echo "remove source folders ($_UNBOUND_NAME $_LIBEVENT_NAME $_OPENSSL_NAME $_EXPAT_NAME $_LIBSODIUM_NAME $_DNSCRYPTPROXY_NAME)"
rm -rf $_UNBOUND_NAME $_OPENSSL_NAME $_EXPAT_NAME $_LIBSODIUM_NAME $_DNSCRYPTPROXY_NAME

echo "Unpack $_UNBOUND_NAME.tar.gz into $_UNBOUND_NAME"
tar xf $_UNBOUND_NAME.tar.gz || error "Cannot unpack $_UNBOUND_NAME.tar.gz"
echo "Unpack $_OPENSSL_NAME.tar.gz into $_OPENSSL_NAME"
tar xf $_OPENSSL_NAME.tar.gz || error "Cannot unpack $_OPENSSL_NAME.tar.gz"
echo "Unpack $_EXPAT_NAME.tar.gz into $_EXPAT_NAME"
tar xf $_EXPAT_NAME.tar.gz || error "Cannot unpack $_EXPAT_NAME.tar.gz"
echo "Reseting $_LIBEVENT_NAME to known state"
cd $_LIBEVENT_NAME
git reset --hard
git checkout $_LIBEVENT_GIT_BRANCH
test -n "$_LIBEVENT_PATCH" && git apply < $_LIBEVENT_PATCH
cd ..
echo "Unpack $_LIBSODIUM_NAME.zip into $_LIBSODIUM_NAME"
unzip $_LIBSODIUM_NAME.zip || error "Cannot unpack $_LIBSODIUM_NAME.zip"
echo "Unpack $_DNSCRYPTPROXY_NAME.zip into $_DNSCRYPTPROXY_NAME"
unzip $_DNSCRYPTPROXY_NAME.zip || error "Cannot unpack $_DNSCRYPTPROXY_NAME.zip"

echo "cleanup.sh finished successfully"
