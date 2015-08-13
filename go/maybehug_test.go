package maybehug_test

import "fmt"
import maybehugs "github.com/zkat/maybe-hugs/go"

type LovelyCutie struct {
	wantsHug bool
}

func (c LovelyCutie) RespondsToHug() bool {
	return c.wantsHug
}

func ExampleMaybeHug() {
	cutieNotWantingHug := LovelyCutie{
		wantsHug: false,
	}
	fmt.Println(maybehugs.MaybeHug(cutieNotWantingHug))
	// Output: Empathy!
}

func ExampleMaybeHug_second() {
	cutieWantingHug := LovelyCutie{
		wantsHug: true,
	}
	fmt.Println(maybehugs.MaybeHug(cutieWantingHug))
	// Output: Hug!
}
