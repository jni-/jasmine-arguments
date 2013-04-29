JasmineArgumentsBuilder.prototype.startsWith = (expected) ->
  builder = JasmineArgumentsBuilder().getBuilder(this)
  builder.addMatcher new JasmineArgumentsMatcher((actual) ->
    actual.indexOf(expected) == 0
  , "<Begins with '#{jasmine.pp(expected)}'>")

JasmineArgumentsBuilder.prototype.contains = (expected) ->
  builder = JasmineArgumentsBuilder().getBuilder(this)
  builder.addMatcher new JasmineArgumentsMatcher((actual) ->
    actual.indexOf(expected) >= 0
  , "<Contains '#{jasmine.pp(expected)}'>")


JasmineArgumentsBuilder.prototype.hasItems= (expected_items) ->
  builder = JasmineArgumentsBuilder().getBuilder(this)
  builder.addMatcher new JasmineArgumentsMatcher((actual) ->

    return false if actual is null or typeof actual isnt "object"

    for expectedKey, expectedValue of expected_items
      return false unless expectedKey of actual and actual[expectedKey] is expectedValue
    true
  , "<Contains item(s) #{jasmine.pp(expected_items)}>")