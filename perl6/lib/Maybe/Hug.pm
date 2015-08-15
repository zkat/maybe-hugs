class Maybe::Hug {
  has $.cutie where { .can('accept-hugs') };
  has $.from;
  method hugs(&dothething) { dothething() if self }
  method empathy(&dothething) { dothething() unless self }
  method by($from) { Maybe::Hug.new(:$!cutie, :$from) }
  method Bool() { $!cutie.accept-hugs($!from) }
}

sub circumfix:<{{ }}>($cutie, $from?) is export { Maybe::Hug.new(:$cutie, :$from) }
