describe 'jasmine-arguments-matchers', ->
  describe 'startsWith', ->
    matcher = undefined

    beforeEach ->
      matcher = jasmine.Arg().startsWith

    it 'should return true if search string is empty', ->
      expectMatcher(matcher, "", "abcde").toBeTruthy()

    it 'should return false if search string is undefined', ->
      expectMatcher(matcher, jasmine.undefined, "abcde").toBeFalsy()

    it 'should return true because abcde starts with a (startsWith one caracter)', ->
      expectMatcher(matcher, "a", "abcde").toBeTruthy()

    it 'should return true because abcde starts with abc (startsWith many caracter', ->
      expectMatcher(matcher, 'abc', 'abcde').toBeTruthy()

    it 'should return false because abcde does not contain xyz', ->
      expectMatcher(matcher, 'xyz', 'abcde').toBeFalsy()

    it 'should return false because abcde contains cde, but does not start with it', ->
      expectMatcher(matcher, 'cde', 'abcde').toBeFalsy()

    it 'should return true when both stacked matchers are true', ->
      expect(jasmine.Arg().startsWith('abc').startsWith('abc').jasmineMatches('abcde')).toBeTruthy()

    it 'should return false when one of the stacked matchers is false', ->
      expect(jasmine.Arg().startsWith('abc').startsWith('cde').jasmineMatches('abcde')).toBeFalsy()

  describe 'contains', ->
    matcher = jasmine.undefined

    beforeEach ->
      matcher = jasmine.Arg().contains

    it 'should return false if search string is undefined', ->
      expectMatcher(matcher, jasmine.undefined, 'abcde').toBeFalsy()

    it 'should return true if both strings are empty', ->
      expectMatcher(matcher, '', '').toBeTruthy()

    it 'should return true because abc is the beginning of abcde', ->
      expectMatcher(matcher, 'abc', 'abcde').toBeTruthy()

    it 'should return true because bcd is contained in abcde', ->
      expectMatcher(matcher, 'bcd', 'abcde').toBeTruthy()

    it 'should return false because bcz is not contained in abcde', ->
      expectMatcher(matcher, 'bcz', 'abcde').toBeFalsy()

    it 'should return true because both abc and bcd are contained in abcde', ->
      expect(jasmine.Arg().contains('abc').contains('bcd').jasmineMatches('abcde')).toBeTruthy()

    it 'should return false because abc is contained in abcde, but not def', ->
      expect(jasmine.Arg().contains('abc').contains('def').jasmineMatches('abcde')).toBeFalsy()

  describe 'hasItems', ->
    matcher = jasmine.undefined

    beforeEach ->
      matcher = jasmine.Arg().hasItems

    it 'should return false if the array does not contain the value', ->
      expectMatcher(matcher, ["test"], ["some", "more", "stuff"]).toBeFalsy()

    it 'shoudl return false if the array does not contain the value at the correct position', ->
      expectMatcher(matcher, ["test"], ["some", "more", "test"]).toBeFalsy()

    it 'should return false if the actual array is empty', ->
     expectMatcher(matcher, ["test"], []).toBeFalsy()

    it 'should return true if the value is at the correct position', ->
      expectMatcher(matcher, ["test"], ["test", "something"]).toBeTruthy()

    it 'should return true if testing an object that simulates an array', ->
      expectMatcher(matcher, {1: "something"}, ["test", "something"]).toBeTruthy()

    it 'should return false if the object does not contain the key', ->
      expectMatcher(matcher, {key: "value"}, {random: "value"}).toBeFalsy()

    it 'should return false if the object contains the key, but the value differs', ->
      expectMatcher(matcher, {key: "value"}, {key: "not the value"}).toBeFalsy()

    it 'should return true if the value and the key are in the object', ->
      expectMatcher(matcher, {key: "value"}, {random: "stuff", key: "value"}).toBeTruthy()
