Maybe-Hugs
----------

```perl6
use Test;
need Cutie;
use Maybe::Hug;

role Huggable does Cutie {
  has Bool $.hug-ok is rw = False;
  method accept-hugs() { $.hug-ok }
}

role AlternatingHuggable does Cutie {
  has $!hugs = 0;
  method accept-hugs() { Bool(++$!hugs % 2) }
}

my Cutie $alice = "Alice" does Huggable(:hug-ok);
my Cutie $betty = "Betty" does Huggable;
my Cutie $carol = "Carol" does AlternatingHuggable;
my $elision = "Elision";

plan 6;

ok maybe-hug($alice), "$alice Hugs";

ok !maybe-hug($betty), "$betty Didn't positively affirm huggability, so no hugs";

ok maybe-hug($carol), "$carol wants one this time";
ok !maybe-hug($carol), "$carol doesn't now though";

throws-like { maybe-hug $elision }, X::TypeCheck, "$elision doesn't even";

$alice.hug-ok = False;
ok !maybe-hug($alice), "$alice changed her mind";
```
