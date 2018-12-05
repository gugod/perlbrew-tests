#!/bin/bash

assert_rc_ok() {
    if [[ $rc -ne 0 ]]; then
        echo FAIL. Exit Status: $rc
        echo
        exit $rc
    fi    
}

set -x

cd
curl -sS -L https://install.perlbrew.pl | bash
source ~/perl5/perlbrew/etc/bashrc

perlbrew info
rc=$?
assert_rc_ok

perlbrew available
rc=$?
assert_rc_ok

echo
echo '__END__'
echo DONE
echo 
exit $rc
