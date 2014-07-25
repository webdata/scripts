use strict;
use warnings;

my @random_set;
my %insert_row;
my %delete_row;

my $max_value = 8;
my $num_randoms_deletes = 5;
my $num_randoms_inserts = 3;

print "delete rows: ";
for (1..$num_randoms_deletes) {
        my $candidate = int rand($max_value)+1;
        redo if $delete_row{$candidate}++;
        print $candidate." ";
}
print "\n";

print "insert rows: ";
for (1..$num_randoms_inserts) {
        my $candidate = int rand($max_value)+1;
        redo if $insert_row{$candidate}++;
        print $candidate." ";
}
print "\n";

my $file="input.txt";

open my $in,  '<',  $file      or die "Can't read old file: $!";
open my $out, '>', "$file.new" or die "Can't write new file: $!";


while( <$in> ) {
        if (!$delete_row{$.}){
                print $out $_;
        }
        if ($insert_row{$.}){
                print $out "<inserted>".$_;
        }
}


close $out;
