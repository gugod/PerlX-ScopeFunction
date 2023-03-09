use v5.36;
use Test2::V0;

use PerlX::ScopeFunction::with;

sub range ($n) {
    (1..$n)
}

subtest "basic", sub {
    with( range(5) ) {
        is \@_, array {
            item 1;
            item 2;
            item 3;
            item 4;
            item 5;
        }
    };

    with( 1..5 ) {
        is \@_, array {
            item 1;
            item 2;
            item 3;
            item 4;
            item 5;
        }
    }
};


done_testing;
