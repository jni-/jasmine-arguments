((jasmine) ->
  JasmineArguments = ->
    return new JasmineArgumentsBuilder()


  JasmineArgumentsMatcher = (matcher, message) ->
    this.jasmineMatches = (actual) ->
      matcher(actual)

    this.jasmineToString = () ->
      message
    this

  JasmineArgumentsBuilder = ->
    matchers = new Array()
    finalMessage = ''
    builder = this
    this.jasmineMatches = (actual) ->
      result = matchers.length > 0
      finalMessage = ''
      for matcher in matchers
        currentResult = matcher.jasmineMatches(actual)
        result = result && currentResult
        finalMessage += ' AND ' if finalMessage.length > 0 && !currentResult
        finalMessage += matcher.jasmineToString()
        break if !result
      result

    this.jasmineToString = ->
      finalMessage

    this.addMatcher = (matcher) ->
      matchers.push matcher if matcher.jasmineMatches != jasmine.undefined
      builder

    this.is = (expected) ->
      matcher = new JasmineArgumentsMatcher((actual) ->
        actual == expected
      , expected == jasmine.undefined ? '<Undefined>' : expected.toString())

      matchers.push matcher
      builder

    this.isTruthy = ->
      builder.addMatcher new JasmineArgumentsMatcher((actual) ->
        !!actual
      , "<Truthy argument>")

    this.isFalsy = ->
      builder.addMatcher new JasmineArgumentsMatcher((actual) ->
        !actual
      , "<Falsy argument>")

    this.getBuilder = (obj) ->
      if obj == window then new JasmineArgumentsBuilder() else obj

    return new JasmineArgumentsBuilder if this == window
    this

  window.JasmineArgumentsBuilder = JasmineArgumentsBuilder
  window.JasmineArgumentsMatcher = JasmineArgumentsMatcher
  jasmine.Arg = JasmineArguments

) jasmine
