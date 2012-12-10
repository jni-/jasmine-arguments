Jasmine Arguments
=================

Jasmine Arguments is an extensible set of argument matchers for jasmine's spies.

Downloadable files are in lib/. I suggest either jasmine.arguments.js or its minified version

What does it do exactly?
------------------------

It allows you to do this : 

	spyOn(console, 'log')
	console.log('message for which I only know a certain part')
	expect(console.log).toHaveBeenCalledWith(jasmine.Arg().contains('a certain'));

Well, obviously this is the academic non-sense example, but I'm sure you'll find this to come handy eventually.

I'm a tech dude, throw details at me
------------------------------------

All matchers are chainable. You can do this : 

	expect(console.log).toHaveBeenCalledWith(jasmine.Arg().contains('for').contains('message'))

You can also create new matchers. It's not elegant for now, but it'll be re-worked soon. Here is an example : 

	JasmineArgumentsBuilder.prototype.contains = function(expected) {
	  var builder;
	  builder = JasmineArgumentsBuilder().getBuilder(this);
	  return builder.addMatcher(new JasmineArgumentsMatcher(function(actual) {
	    return actual.indexOf(expected) >= 0;
	  }, "<Contains '" + expected + "'>"));
	};


Ok ok, I'm lazy. This is only an example taken from the actual compiled coffeescript. If you want an example in coffeescript, check out jasmine.arguments.matchers.coffee.

The _addMatcher_ method takes an object of type JasmineArgumentsMatcher. This one takes 2 things in its constructor : a function that will be used to match the value and a string representing the matcher.

TODO
----

This is a very early release.

* Add a .not() modifier
* Add more matchers
* Add some kind of doc
* Make creating matchers more elegant
* Add compatibility tests with other jasmine packages
* Create a cake task to merge JS files (or coffee files prior to compilation)
* Create a cake task to minify code
