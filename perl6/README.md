Maybe-Hugs
----------

```perl6
need Cutie;
use Maybe::Hug;

my Cutie $alice = "Alice" does Cutie(:accept-hugs);
my Cutie $betty = "Betty" does Cutie;
my Str $spot = "Spot";

my Int $test = 0;

say "1..4";

say "{maybe-hug($alice) ?? "ok" !! "not ok"} {++$test} - {$alice} Hugs ({maybe-hug($alice)})";

say "{maybe-hug($betty) ?? "not ok" !! "ok"} {++$test} - {$betty} Doesn't Hug";

try {
  say "not ok {++$test} - {$spot} doesn't even ({maybe-hug($spot)})";
  CATCH {
    when X::Method::NotFound {
      say "ok {$test} - {$spot} doesn't even";
    }
  }
}

$alice.accept-hugs = False;
say "{maybe-hug($alice) ?? "not ok" !! "ok"} {++$test} - {$alice} changed her mind";
```
