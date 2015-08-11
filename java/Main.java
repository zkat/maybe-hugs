public class Main {

    public static void main(String[] args) {
        // Test out the hugging capabilities
        Cutie hugger = new Cutie();
        Cutie nonHugger = new Cutie();
        testHugger(hugger, true);
        testHugger(nonHugger, false);

        System.out.println("Hugger got " + hugger.getNumberOfHugs() + " hugs "
                + " and " + hugger.getNumberOfTlc() + " empathies.\n");
        System.out.println("Non-hugger got " + nonHugger.getNumberOfHugs() + " hugs "
                + " and " + nonHugger.getNumberOfTlc() + " empathies.\n");
    }

    public static void testHugger(Cutie cutie, boolean testVal)
    {
        cutie.setAcceptsHugs(testVal);
        MaybeHug maybeHug = null;
        try {
            maybeHug = new MaybeHug(cutie);
            maybeHug.hug();
        } catch (NoCutieException e) {
            System.err.println("No cutie to hug! :(");
            e.printStackTrace();
        }
    }
}
