class Maybe::Hug {
  has $.cutie where { defined .accept-hugs };
  method hug { $.cutie.accept-hugs ?? "HUG!" but True !! "Empathy!" but False }
}

sub maybe-hug($cutie) is export { Maybe::Hug.new(:$cutie).hug() }

