use Test2::V0;
use PerlX::ScopeFunction qw(let);

subtest "single scalar context statement", sub {
    let ($foo = 1) {
        is $foo, 1;
    }
};

subtest "single list-context statement", sub {
    let ($bar = 1, $foo = 2) {
        is $foo, 2;
        is $bar, 1;
    }
};

subtest "multiple statements", sub {
    let ($foo = 1; $bar = 2) {
        is $foo, 1;
        is $bar, 2;
    }

    let (@bar = (1,2,3); $foo = 4) {
        is \@bar, [ 1, 2, 3 ];
        is $foo, 4;
    }

    let (@bar = (1,2,3); @foo = (4,5,6)) {
        is \@bar, [ 1, 2, 3 ];
        is \@foo, [ 4, 5, 6 ];
    }
};

done_testing;
