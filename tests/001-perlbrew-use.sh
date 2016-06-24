#!/bin/sh

export PERLBREW_ROOT="/tmp/perlbrew-tests/test-$$"

echo "# PERLBREW_ROOT = ${PERLBREW_ROOT}"

mkdir -p ${PERLBREW_ROOT}

( curl -L https://install.perlbrew.pl | bash ) >/dev/null 2>&1
source ${PERLBREW_ROOT}/etc/bashrc

echo "# install perl-5.14.2 and perl-5.16.0"

perlbrew install -j 4 --notest perl-5.14.2
perlbrew install -j 4 --notest perl-5.16.0

## assume those installation are successful..

echo "1..4"
perlbrew use perl-5.14.2

if [ "$PERLBREW_PERL" = "perl-5.14.2" ]; then
    echo "ok 1 - perlbrew use set PERLBREW_PERL var"
else
    echo "not ok 1"
fi

pv=`perl -e 'print $]'`

if [ "$pv" = "5.014002" ]; then
    echo "ok 2"
else
    echo "not ok 2"
fi

perlbrew use perl-5.16.0
if [ "$PERLBREW_PERL" = "perl-5.16.0" ]; then
    echo "ok 3 - perlbrew use set PERLBREW_PERL var"
else
    echo "not ok 3"
fi

pv=`perl -e 'print $]'`

if [ "$pv" = "5.016000" ]; then
    echo "ok 4"
else
    echo "not ok 4"
fi
