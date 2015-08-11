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

public:
	void setAcceptsHugs(bool value);
	bool acceptsHugs();

	void hug();
	void empathy();

	unsigned int showHugs();
	unsigned int showTlc();
};

#endif
