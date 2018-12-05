#!/bin/bash
cd
curl -L https://install.perlbrew.pl | bash
source ~/perl5/perlbrew/etc/bashrc

perlbrew info
rc=$?

echo '========'
echo DONE
echo 
exit $rc
