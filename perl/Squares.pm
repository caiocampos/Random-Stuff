# Declare package 'Leap'
package Squares;
use strict;
use warnings;
use Exporter 'import';

sub new {
 my ($class, $val) = @_;
 # my $self = bless({}, $class);
 # $self->{val} = $val;
 # return $self;
 # or
 bless {val => $val}, $class;
}

sub sum_of_squares {
  my $self = shift;
  my $val = 0;
  for (1..$self->{val}) {
      $val += $_ * $_;
  }
  $val
}

sub square_of_sum {
  my $self = shift;
  my $val = 0;
  for (1..$self->{val}) {
      $val += $_;
  }
  $val * $val
}

sub difference {
  my $self = shift;
  $self->square_of_sum - $self->sum_of_squares
}

1;