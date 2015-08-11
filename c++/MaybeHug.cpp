#include <iostream>
#include <typeinfo>
#include "Cutie.h"
#include "MaybeHug.h"

MaybeHug::MaybeHug(Cutie* cutie)
{
	if (cutie == NULL)
	{
		throw NoCutieException();
	}
	this->cutie = cutie;
}

void MaybeHug::hug()
{
	if (cutie->acceptsHugs())
	{
		cutie->hug();
	}
	else
	{
		cutie->empathy();
	}
}
