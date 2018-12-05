#!/bin/bash

assert_ok() {
    echo "#" $*
    $*
    rc=$?

    if [[ $rc -ne 0 ]]; then
        echo FAIL. Exit Status: $rc
        echo
        exit $rc
    fi    
}

cd
curl -sS -L https://install.perlbrew.pl | bash
source ~/perl5/perlbrew/etc/bashrc

assert_ok perlbrew info
assert_ok perlbrew available
assert_ok perlbrew install-cpanm -f
assert_ok perlbrew install-patchperl -f

which cpanm
which patchperl

rc=$?
echo
echo '__END__'
echo DONE
echo 
exit $rc
