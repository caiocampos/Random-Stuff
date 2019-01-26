# Declare package 'Bob'
package Bob;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(hey);

sub hey {
  my ($msg) = @_;
  my $is_upper = $msg =~ /[[:upper:]]/ && $msg =~ /^[^[:lower:]]+$/;
  my $is_question = $msg =~ /\?\s*$/;
  return 'Calm down, I know what I\'m doing!' if $is_upper && $is_question;
  return 'Whoa, chill out!' if $is_upper;
  return 'Sure.' if $is_question;
  return 'Fine. Be that way!' if $msg =~ /^\s*$/;
  return 'Whatever.'
}

1;
