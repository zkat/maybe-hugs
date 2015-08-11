use strict;
use warnings;
use Test::More tests => 4;
use Moops;
use Maybe::Hug;

class CutiePerson with Cutie {
  has name => (is => "ro", isa => "Str");
}

class CutiePet {
  has name => (is => "ro", isa => "Str");
}

my $alice = new CutiePerson(name=>"Alice", acceptHugs=>1);
my $betty = new CutiePerson(name=>"Betty");
my $spot  = new CutiePet(name=>"Spot");

is(maybeHug($alice), 'HUG!', $alice->name . " Hugs");
is(maybeHug($betty), 'Empathy!', $betty->name . " Doesn't Hug");

eval {
  maybeHug($spot);
  fail($spot->name . "doesn't even");
};
if ($@) {
  pass($spot->name . "doesn't even");
}

$alice->acceptHugs(0);
is(maybeHug($alice), 'Empathy!', $alice->name . " changed her mind");
