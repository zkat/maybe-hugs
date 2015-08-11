#include <iostream>
#include "Cutie.h"
#include "MaybeHug.h"

void testHugger(Cutie* &cutie, bool testVal);

int main()
{
	// Test out the hugging capabilities

	Cutie* hugger = new Cutie();
	Cutie* nonHugger = new Cutie();
	testHugger(hugger, true);
	testHugger(nonHugger, false);

	std::cout << "Hugger got " << hugger->getNumberOfHugs() << " hugs "
		<< " and " << hugger->getNumberOfTlc() << " empathies.\n";
	std::cout << "Non-hugger got " << nonHugger->getNumberOfHugs() << " hugs "
		<< " and " << nonHugger->getNumberOfTlc() << " empathies.\n";
}

void testHugger(Cutie* &cutie, bool testVal)
{
	cutie->setAcceptsHugs(testVal);
	MaybeHug maybeHug(cutie);
	maybeHug.hug();
}
