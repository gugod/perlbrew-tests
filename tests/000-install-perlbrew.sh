#!/bin/sh

export PERLBREW_ROOT="/tmp/perlbrew-tests/test-$$"

echo "# perlbrew installation test"
echo "# PERLBREW_ROOT = ${PERLBREW_ROOT}"

mkdir -p ${PERLBREW_ROOT}

( curl -kL http://install.perlbrew.pl | bash ) >/dev/null 2>&1

echo "1..2"

if [ -f "${PERLBREW_ROOT}/bin/perlbrew" ]; then
    echo "ok 1 - perlbrew found"
else
    echo "not ok 1 - perlbrew not found"
fi

if [ -f "${PERLBREW_ROOT}/bin/patchperl" ]; then
    echo "ok 2 - patchperl found"
else
    echo "not ok 2 - patchperl not found"
fi
