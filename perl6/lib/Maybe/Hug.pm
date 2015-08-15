class Maybe::Hug {
  has $.cutie where { .can('accept-hugs') };
  method hug { $.cutie.accept-hugs() ?? "HUG!" but True !! "Empathy!" but False }
}

sub circumfix:<{{ }}>($cutie) is export { Maybe::Hug.new(:$cutie).hug() }
