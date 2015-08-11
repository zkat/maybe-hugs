Maybe::Hug
----------

```perl
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

say maybeHug($alice); # HUGS!
say Maybe::Hug->new($betty)->hug; # Empathy!
```
