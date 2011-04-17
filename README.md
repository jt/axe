axe
======

axe is a command line utility that makes parsing logs easy as you develop.

Install
-------

    gem install axe

Commands
--------

    $ axe
    > tail -f log/development.log

    $ axe active_record
    > tail -f log/development.log | grep active_record

    $ axe active_record action_view INSERT
    > tail -f log/development.log | grep "active_record\|action_view\|INSERT"

    $ axe -e test
    > tail -f log/test.log

    $ axe -e test active_record action_view INSERT
    > tail -f log/test.log | grep "active_record\|action_view\|INSERT"

    $ axe -n 50
    > tail -n 50 log/development.log

    $ axe -n 50 INSERT
    > tail -n 50 log/development.log | grep INSERT
