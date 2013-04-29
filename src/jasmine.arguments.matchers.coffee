JasmineArgumentsBuilder.prototype.startsWith = (expected) ->
  builder = JasmineArgumentsBuilder().getBuilder(this)
  builder.addMatcher new JasmineArgumentsMatcher((actual) ->
    actual.indexOf(expected) == 0
  , "<Begins with '#{expected}'>")

JasmineArgumentsBuilder.prototype.contains = (expected) ->
  builder = JasmineArgumentsBuilder().getBuilder(this)
  builder.addMatcher new JasmineArgumentsMatcher((actual) ->
    actual.indexOf(expected) >= 0
  , "<Contains '#{expected}'>")


JasmineArgumentsBuilder.prototype.hasItems= (expectedItems) ->
  builder = JasmineArgumentsBuilder().getBuilder(this)
  builder.addMatcher new JasmineArgumentsMatcher((actual) ->
    for expectedKey, expectedValue of expectedItems
      return false unless expectedKey of actual and actual[expectedKey] is expectedValue
    true
  , "<Contains item(s) #{expectedItems}>")