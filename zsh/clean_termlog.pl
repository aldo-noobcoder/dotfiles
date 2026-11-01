#!/usr/bin/perl
local $/ = undef;
my $data = <>;

# strip OSC sequences (title, semantic prompt markers)
$data =~ s/\x1b\][^\x07\x1b]*(\x07|\x1b\x5c)//g;
# strip CSI sequences (colors, cursor movement)
$data =~ s/\x1b\[[0-9;]*[a-zA-Z]//g;

# simulate terminal overwrite: for each line, keep only what follows
# the LAST \r (i.e. what actually ends up on screen)
for my $line (split /\n/, $data, -1) {
    my @parts = split /\r/, $line;
    my $rendered = $parts[-1] // '';
    $rendered =~ s/\s+$//;   # trim trailing padding/whitespace
    print "$rendered\n";
}
