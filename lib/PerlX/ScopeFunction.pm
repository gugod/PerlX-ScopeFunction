package PerlX::ScopeFunction;
use v5.36;

use Keyword::Simple;
use Text::Balanced qw( extract_bracketed extract_codeblock );

sub import {
    Keyword::Simple::define 'with', \&__rewrite_with;
}

sub unimport {
    Keyword::Simple::undefine 'with';
}

sub __rewrite_with {
    my ($ref) = @_;
    my $remainder;
    (my $expr, $remainder) = extract_bracketed($$ref, '()');
    (my $codeBlock, $remainder) = extract_codeblock( $remainder );
    my $code = '(sub ' . $codeBlock . ')->' . $expr . ";";
    $$ref = $code . $remainder;
}

1;
