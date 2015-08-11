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
	try
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
	catch (NoCutieException)
	{
		std::cerr << "No Cutie provided to MaybeHug :(";
	}
}
