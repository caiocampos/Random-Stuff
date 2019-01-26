package TwoFer;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(two_fer);

sub two_fer {
  my $name =  shift // "you";
  # or
  # my ($name) = @_;
  # $name //= "you";
  #
  # or
  # my ($name) = @_;
  # unless ($name) {
  #   $name = "you"
  # }
  "One for $name, one for me."
}

1;
