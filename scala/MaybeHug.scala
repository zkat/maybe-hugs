sealed trait MaybeHug[+E, +A]
case class Hug[+E](get: E) extends MaybeHug[E, Nothing]
case class Empathy[+A](get: A) extends MaybeHug[Nothing, A]

object Cutie {
  def empathic: MaybeHug[String, String] =
    Empathy("Cutie prefers empathy! ")

  def huggable: MaybeHug[String, String] =
    Hug("HUG !")

  def hug(p: MaybeHug[String, String]): String =
    p match {
      case Hug(s) => s
      case Empathy(s) => s
    }
}

def kate = Cutie.huggable
def john = Cutie.empathic

println(Cutie.hug(kate))
println(Cutie.hug(john))
