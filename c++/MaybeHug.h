#ifndef _MAYBEHUG_H_
#define _MAYBEHUG_H_

class MaybeHug
{
private:
	class NoCutieException { };
	Cutie* cutie;

public:
	MaybeHug(Cutie* cutie);
	void hug();
};

#endif
