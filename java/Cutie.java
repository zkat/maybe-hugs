public class Cutie {
    private boolean respondsToHugs;
    private int hugs;
    private int tlc;

    public Cutie() {
        respondsToHugs = false;
        hugs = 0;
        tlc = 0;
    }

    public void setAcceptsHugs(boolean value) {
        respondsToHugs = value;
    }

    public boolean acceptsHugs() {
        return respondsToHugs;
    }

    public void hug() {
        hugs++;
    }

    public void empathy() {
        tlc++;
    }

    public int getNumberOfHugs() {
        return hugs;
    }

    public int getNumberOfTlc() {
        return tlc;
    }
}
