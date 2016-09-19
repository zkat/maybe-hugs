/**
 * Any creature declared as mortal can be hugged or
 * prefer empathy.
 *
 * Usage:
 *
 * ?- hugs(livvie).
 * true.
 *
 * ?- prefers_empathy(livvie).
 * false.
 *
 * ?- hugs(jane).
 * false.
 *
 * ?- prefers_empathy(jane).
 * true.
 */


mortal(livvie).
mortal(jane).

huggable(livvie).

hugs(X) :- mortal(X), huggable(X).
prefers_empathy(X) :- mortal(X), \+ (huggable(X)).
