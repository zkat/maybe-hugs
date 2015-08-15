Maybe-Hugs
----------

First we'll need some cuties...

```perl6
need Cutie;
use Maybe::Hug;

role HugAllCuties does Cutie {
  multi method accept-hugs (Cutie $from) { True }
}
role HugNoCuties does Cutie {
  multi method accept-hugs (Cutie $from) { False }
}
role HugSomeCuties does Cutie {
  has @.whom;
  multi method accept-hugs (Cutie $from) { Bool(@.whom.first: {$_ === $from}) }
}
role HugSometimes does Cutie {
  has $.in-the-mood is rw = False;
  multi method accept-hugs (Cutie $from) { $.in-the-mood }
}

my Cutie $alice = "Alice" does HugAllCuties;
my Cutie $betty = "Betty" does HugNoCuties;
my Cutie $carol = "Carol" does HugSomeCuties(:whom($alice));
my Cutie $danielle = "Danielle" does HugSometimes;
```

Now, if we offer hugs to Alice…

```
given {{$alice}} {
  .hugs: { say "HUGS!" }
  .empathy: { say "Empathy!" }
}
```

We'll find Alice always wants hugs.  Alternatively, trying the same thing
with Betty would find her desire for empathy every time.

Carol by contrast is a bit different, she'll take hugs from Alice but no one else:

```
given $alice ==> {{$carol}} {
  .hugs: { say "HUGS!" }
  .empathy: { say "Empathy!" }
}
```

Trying the same thing with `$betty ==> {{$carol}}` shows that Carol would
prefer empathy from Betty.

Alternatively you could say this with `{{$carol}}.by($betty)`.

Finally, more realistically, Danielle sometimes is ok with hugs and sometimes isn't...
```
given $alice ==> {{$danielle}} {
  .hugs: { say "HUGS!" }
  .empathy: { say "Empathy!" }
}
```
Will show her desire for empathy, but if she's later feeling more touchy feely...
```
$danielle.in-the-mood = True
given $alice ==> {{$danielle}} {
  .hugs: { say "HUGS!" }
  .empathy: { say "Empathy!" }
}
```
Then the same offer will result in HUGS.

## What's going on

The `Maybe::Hug` module introduces a new circumfix operator `{{ }}` which
when wrapped around a `Cutie` returns a `Maybe::Hug` object.  If you feed
the operator, eg `$person ==> {{$cutie}}` then that person is added to the
`Maybe::Hug` as the person offering the hug.

## Exported functions

### circumfix:<{{ }}>($cutie where {.can('accept-hugs')}, $from?)

Constructs a new Maybe::Hug object... literally just defined as:

```
Maybe::Hug.new(:$cutie, :$from)
```

## Maybe::Hug

### .new(:$cutie where {.can('accept-hugs')}, :$from)

Constructs a new Maybe::Hug. We need a $cutie, but $from is optional.

### .by($from) returns Maybe::Hug

Returns a new Maybe::Hug object where hugging is being done by $from

### .Bool()

If used in boolean context, the Maybe::Hug will return true if the cutie
prefers hugs, false if they prefer empathy.

### .hugs: { stuff to do if they want hugs }

Executes the block if the cutie prefers hugs

### .empathy: { stuff to do if they want empathy }

Executes the block if the cutie prefers empathy
