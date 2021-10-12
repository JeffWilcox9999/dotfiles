#!/usr/bin/env perl
use warnings;

# Renames all files that match 'search' by transforming 'pattern' to 'replacement'
if ( ( $#ARGV + 1 ) == 3 ) {
    ( $file_patt, $regexp, $replacement ) = @ARGV;

    #print "$file_patt, $regexp, $replacement\n";
}
elsif ( ( $#ARGV + 1 ) == 2 )    #default to all files
{
    $file_patt = '*.*';
    ( $regexp, $replacement ) = @ARGV;
}
else {
    print "usage: ren.pl \"files-to-rename\" pattern replacement\n";
    print "or     ren.pl pattern replacement\n";
    exit 1;
}

# dry run to give user a chance to tune regexp
my @changes;
foreach $file ( glob($file_patt) ) {
    chomp $file;

    my $newname = $file;
    if ( $newname =~ s/$regexp/$replacement/g ) {
        push @changes, { OLD => $file, NEW => $newname };

        if ( length($file) < 35 and length($newname) < 35 ) {
            print "$file => $newname\n";
        }
        else {
            print "$file =>\n\t$newname\n";
        }
    }
}

if (@changes) {
    print "\n---------------------------\n";
    print "Do you want to rename?(y/n)? ";
    chomp( $ans = <STDIN> );
    exit 0 if $ans ne 'y' and $ans ne 'Y';
}
else {
    print "No files matched input pattern '$regexp'\n";
}

# does the renaming
foreach $change (@changes) {

    #print("$change->{OLD} -> $change->{NEW}\n");

    unless ( -e $change->{NEW} ) {
        print "$change->{NEW}\n";
        rename( $change->{OLD}, $change->{NEW} );
    }
    else {
        print "$change->{NEW} already exists, Skipping!\n";
    }
}
