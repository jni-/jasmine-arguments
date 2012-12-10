this.expectMatcher = (matcher, expected, actual) ->
  expect(matcher(expected).jasmineMatches(actual))

this.addFakeMatcher = (matcherBuilder, matcherName, returnValue) ->
  matcherBuilder.__proto__[matcherName] = (expected) ->
    jasmine.undefined
