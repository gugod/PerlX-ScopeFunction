requires 'Const::Fast';
requires 'Keyword::Simple';
requires 'PPR';
requires 'Package::Stash';

on test => sub {
    requires 'Test2::Harness';
    requires 'Test2::V0';
};
