package maybehug

// Cutie is someone to hug (or not)
type Cutie interface {
	RespondsToHug() bool
}

// MaybeHug maybe hugs a cutie
func MaybeHug(c Cutie) string {
	if c.RespondsToHug() {
		return "Hug!"
	}
	return "Empathy!"
}
