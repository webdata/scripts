#!/usr/bin/perl -w
use Cwd 'abs_path';
use constant false => 0;
use constant true  => 1;

$directory="dataset";
if (@ARGV>0){
        $directory = $ARGV[0];
}



print "\n****************************\n";
print "******** TESTs ******\n";
print "****************************\n";
print "** Univer. of Sapienza ***\n";
print "****************************\n\n";

print "Usage: perl concatenate.pl directory\n";

print "Result: \n\tdirectory.samplings\n";

$num_records=0;


open FILE_INSERT,  ">",$directory.".samplings";

opendir(DIR, $directory);
@files = readdir(DIR);
$i=1;
foreach $file(@files)
{

        if (($file ne ".") && ($file ne "..")){
                open(DAT, $directory."/".$file)|| die("Could not open file results!");
                foreach $line (<DAT>)
                {       
                        # uncomment to erase final \n of each line
                        # chomp($line); 
                        print FILE_INSERT $i."\t".$line;
                }
                $i+=1;
                close(DAT);
        }
}
close(FILE_INSERT);
