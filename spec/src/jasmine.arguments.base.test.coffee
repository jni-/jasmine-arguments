describe 'jasmine-arguments-base', ->

  describe 'matchers can be stacked so they', ->
    it 'should be false if no matcher is set', ->
      expect(jasmine.Arg().jasmineMatches("")).toBeFalsy()

    it 'should be able to evaluate a single matcher', ->
      matcher = jasmine.Arg().is(true)
      expect(matcher.jasmineMatches(true)).toBeTruthy()

    it 'should be able to create an AND between a true and false matcher ( = false)', ->
      matcher = jasmine.Arg().is(true).is(false)
      expect(matcher.jasmineMatches(true)).toBeFalsy()

    it 'should all be called until one result is false', ->
      matcher = jasmine.Arg()

      spyOn(matcher, 'addMatcher').andCallThrough()

      matcher.isTruthy().isTruthy().isTruthy().jasmineMatches(true)
      expect(matcher.addMatcher.calls.length).toEqual(3)

