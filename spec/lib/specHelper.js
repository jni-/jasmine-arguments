// Generated by CoffeeScript 1.4.0
(function() {

  this.expectMatcher = function(matcher, expected, actual) {
    return expect(matcher(expected).jasmineMatches(actual));
  };

  this.addFakeMatcher = function(matcherBuilder, matcherName, returnValue) {
    return matcherBuilder.__proto__[matcherName] = function(expected) {
      return jasmine.undefined;
    };
  };

}).call(this);
