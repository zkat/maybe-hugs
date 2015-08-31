#include <stdio.h>
#include <unistd.h>

//Define the person to test with
#define NAME         "Amber"
#define ISCUTIE      1
#define LIKESCONTACT 1

typedef struct {
	char  *name;
	short likesPhysicalContact;
	short isCutie;
} human;

void executeHug(human person) {
	printf("%s accepted your offer!\n",person.name);
	sleep(3);
	puts("*hugs*");
	sleep(3);
	printf("You Hugged %s! :^)\n",person.name);
}

void offerHug(human person) {
	puts("You asked for a hug.");
	sleep(3);
	if (person.likesPhysicalContact)
		executeHug(person);
	else
		puts("They'd rather not, thanks for being considerate.");
}

int main() {
	human person = {NAME,LIKESCONTACT,ISCUTIE};
	if (person.isCutie)
		offerHug(person);
	else
		puts("They're not as cute as you first thought...");
	return 0;
}
