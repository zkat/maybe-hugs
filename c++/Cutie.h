#ifndef _CUTIE_H_
#define _CUTIE_H_

class Cutie
{
private:
	bool respondsToHugs;
	unsigned int hugs;
	unsigned int tlc;

public:
	Cutie();

	void setAcceptsHugs(bool value);
	bool acceptsHugs();

	void hug();
	void empathy();

	unsigned int getNumberOfHugs();
	unsigned int getNumberOfTlc();
};

#endif
