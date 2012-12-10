JasmineArgumentsBuilder.prototype.startsWith = (expected) ->
  builder = JasmineArgumentsBuilder().getBuilder(this)
  builder.addMatcher new JasmineArgumentsMatcher((actual) ->
    actual.indexOf(expected) == 0
  , "<Begins with '" + expected + "'>")

JasmineArgumentsBuilder.prototype.contains = (expected) ->
  builder = JasmineArgumentsBuilder().getBuilder(this)
  builder.addMatcher new JasmineArgumentsMatcher((actual) ->
    actual.indexOf(expected) >= 0
  , "<Contains '" + expected + "'>")
