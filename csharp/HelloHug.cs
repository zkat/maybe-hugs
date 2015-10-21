public class Human {
  public bool wantsHug;

  public Human(bool wantHug) {
    wantsHug = wantHug;
  }

  public string MaybeHug() {
    if (wantsHug) {
      return "Hug!";
    }
    return "Empathy";
  }

}

public class HelloHug
{
   public static void Main()
   {
     Human hugYes = new Human(true);
     Human hugNo = new Human(false);

     System.Console.WriteLine(hugYes.MaybeHug());
     System.Console.WriteLine(hugNo.MaybeHug());
   }
}
