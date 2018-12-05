#!/bin/bash
cd
curl -sS -L https://install.perlbrew.pl | bash
source ~/perl5/perlbrew/etc/bashrc

perlbrew info
rc=$?

echo
echo '__END__'
echo DONE
echo 
exit $rc
