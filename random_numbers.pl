use strict;
use warnings;

my @random_set;
my %seen;

my $max_value = 1000;
my $num_randoms = 5;

for (1..$num_randoms) {
    my $candidate = int rand($max_value);
    redo if $seen{$candidate}++;
    push @random_set, $candidate;
}
my @sorted_random = sort { $a <=> $b } @random_set; #sort numbers
print join(', ', @sorted_random), "\n";
