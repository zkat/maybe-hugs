Maybe Hugs in Elm
=================

How to run this thing:

1. Run `npm install`. This will install the correct elm version locally and also run `elm-make` as an npm postinstall hook. When `npm install` has finished there should be a file called `elm.js`.
1. Serve the current directory with the HTTP server of your choice.

Development
-----------

You can either

* `npm run make`: to run elm-make after every change to (re-)create `elm.js`, while serving this directory with your favourite HTTP server, or
* `npm start`: start elm-reactor, which starts a server with live reload on <http://localhost:8000/MaybeHugs.elm>. (Unfortunately, this does not use the custom static html, so the styling will be missing. You can also access <http://localhost:8000/index.html> but I couldn't get the live reload to work there).
