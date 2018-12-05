#!/bin/bash
cd
curl -sS -L https://install.perlbrew.pl | bash
source ~/perl5/perlbrew/etc/bashrc

perlbrew info
rc=$?
if [[ $rc -ne 0 ]]; then
    echo FAIL. Exit Status: $rc
    echo
    exit $rc
fi

perlbrew available
rc=$?
if [[ $rc -ne 0 ]]; then
    echo FAIL. Exit Status: $rc
    echo
    exit $rc
fi

echo
echo '__END__'
echo DONE
echo 
exit $rc
