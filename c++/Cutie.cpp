#include "Cutie.h"

Cutie::Cutie()
{
	// Assume no hugs by default to be safe
	this->respondsToHugs = false;
	this->hugs = 0;
	this->tlc = 0;
}

void Cutie::setAcceptsHugs(bool value)
{
	this->respondsToHugs = value;
}

bool Cutie::acceptsHugs()
{
	return this->respondsToHugs;
}

void Cutie::hug()
{
	++hugs;
}

void Cutie::empathy()
{
	++tlc;
}

unsigned int Cutie::showHugs()
{
	return hugs;
}

unsigned int Cutie::showTlc()
{
	return tlc;
}
