public class MaybeHug {

    private Cutie cutie;

    public MaybeHug(Cutie cutie) throws NoCutieException {
        if (cutie == null) {
            throw new NoCutieException();
        }
        this.cutie = cutie;
    }

    public void hug() {
        if (cutie.acceptsHugs()) {
            cutie.hug();
        } else {
            cutie.empathy();
        }
    }
}
