use Test2::V0;

use PerlX::ScopeFunction 'also';

package O { };

my $obj = bless {}, 'O';

subtest "`also` is UNIVERSAL", sub {
    is $obj->can('also'), T();

    my $pass = 0;
    $obj->also(sub {
                   is $_[0]->isa('O');
                   $pass++;
               })
        ->also(sub {
                   is $_[0]->isa('O');
                   $pass++;
               });
    is $pass, 2;
};

no PerlX::ScopeFunction;
subtest "`also` is unimported", sub {
    is $obj->can('also'), F();
};

done_testing;
