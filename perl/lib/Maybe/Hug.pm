use Moops;
our $VERSION = 1.0.0;

use Cutie;

class Maybe::Hug {
  has cutie => (is => "ro", isa => ConsumerOf["Cutie"]);
  method hug() { $self->cutie->acceptHugs ? "HUG!" : "Empathy!" }
}

package Maybe::Hug {
  use Kavorka;
  use parent qw( Exporter );
  our @EXPORT = qw( maybeHug );

  fun maybeHug($cutie) { Maybe::Hug->new(cutie=>$cutie)->hug }
}
