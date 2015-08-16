use Test;
need Cutie;
use Maybe::Hug;

role HugAllCuties does Cutie {
  multi method accept-hugs (Any $from) { True }
}
role HugNoCuties does Cutie {
  multi method accept-hugs (Any $from) { False }
}
role HugSomeCuties does Cutie {
  has @.whom;
  multi method accept-hugs (Cutie $from) { Bool(@.whom.first: {$_ === $from}) }
}
role HugSometimes does Cutie {
  has $.in-the-mood is rw = False;
  multi method accept-hugs (Any $from) { $.in-the-mood }
}

my Cutie $alice = "Alice" does HugAllCuties;
my Cutie $betty = "Betty" does HugNoCuties;
my Cutie $carol = "Carol" does HugSomeCuties(:whom($alice));
my Cutie $danielle = "Danielle" does HugSometimes;
my $elision = "Elision";

plan 12;

my $wants-hugs = {
  my $msg = "{.cutie} wants hugs{.from ?? " from {.from}" !! "" }";
  .hugs: { pass $msg }
  .empathy: { flunk $msg }
}
my $wants-empathy = {
  my $msg = "{.cutie} wants empathy{.from ?? " from {.from}" !! "" }";
  .hugs: { flunk $msg }
  .empathy: { pass $msg }
}

given {{$alice}} { $wants-hugs($_) };
given $betty ==> {{$alice}} { $wants-hugs($_) }
given $carol ==> {{$alice}} { $wants-hugs($_) }

given {{$betty}} { $wants-empathy($_) };
given $alice ==> {{$betty}} { $wants-empathy($_) };
given $carol ==> {{$betty}} { $wants-empathy($_) };

given {{$carol}} { $wants-empathy($_) };
given $alice ==> {{$carol}} { $wants-hugs($_) };
given $betty ==> {{$carol}} { $wants-empathy($_) };

throws-like { {{$elision}} }, X::TypeCheck, "$elision doesn't even";

given {{$danielle}} { $wants-empathy($_) }
$danielle.in-the-mood = True;
given {{$danielle}} { $wants-hugs($_) }
