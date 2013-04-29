(function() {
    (function(jasmine) {
        var JasmineArguments, JasmineArgumentsBuilder, JasmineArgumentsMatcher;
        return JasmineArguments = function() {
            return new JasmineArgumentsBuilder();
        }, JasmineArgumentsMatcher = function(matcher, message) {
            return this.jasmineMatches = function(actual) {
                return matcher(actual);
            }, this.jasmineToString = function() {
                return message;
            }, this;
        }, JasmineArgumentsBuilder = function() {
            var builder, finalMessage, matchers;
            return matchers = [], finalMessage = "", builder = this, this.jasmineMatches = function(actual) {
                var currentResult, matcher, result, _i, _len;
                for (result = matchers.length > 0, finalMessage = "", _i = 0, _len = matchers.length; _len > _i && (matcher = matchers[_i], 
                currentResult = matcher.jasmineMatches(actual), result = result && currentResult, 
                finalMessage.length > 0 && !currentResult && (finalMessage += " AND "), finalMessage += matcher.jasmineToString(), 
                result); _i++) ;
                return result;
            }, this.jasmineToString = function() {
                return finalMessage;
            }, this.addMatcher = function(matcher) {
                return matcher.jasmineMatches !== jasmine.undefined && matchers.push(matcher), builder;
            }, this.is = function(expected) {
                var matcher, _ref;
                return matcher = new JasmineArgumentsMatcher(function(actual) {
                    return actual === expected;
                }, null != (_ref = expected === jasmine.undefined) ? _ref : {
                    "<Undefined>": "" + expected
                }), matchers.push(matcher), builder;
            }, this.isTruthy = function() {
                return builder.addMatcher(new JasmineArgumentsMatcher(function(actual) {
                    return !!actual;
                }, "<Truthy argument>"));
            }, this.isFalsy = function() {
                return builder.addMatcher(new JasmineArgumentsMatcher(function(actual) {
                    return !actual;
                }, "<Falsy argument>"));
            }, this.getBuilder = function(obj) {
                return obj === window ? new JasmineArgumentsBuilder() : obj;
            }, this === window ? new JasmineArgumentsBuilder() : this;
        }, window.JasmineArgumentsBuilder = JasmineArgumentsBuilder, window.JasmineArgumentsMatcher = JasmineArgumentsMatcher, 
        jasmine.Arg = JasmineArguments;
    })(jasmine);
}).call(this), function() {
    JasmineArgumentsBuilder.prototype.startsWith = function(expected) {
        var builder;
        return builder = JasmineArgumentsBuilder().getBuilder(this), builder.addMatcher(new JasmineArgumentsMatcher(function(actual) {
            return 0 === actual.indexOf(expected);
        }, "<Begins with '" + jasmine.pp(expected) + "'>"));
    }, JasmineArgumentsBuilder.prototype.contains = function(expected) {
        var builder;
        return builder = JasmineArgumentsBuilder().getBuilder(this), builder.addMatcher(new JasmineArgumentsMatcher(function(actual) {
            return actual.indexOf(expected) >= 0;
        }, "<Contains '" + jasmine.pp(expected) + "'>"));
    }, JasmineArgumentsBuilder.prototype.hasItems = function(expected_items) {
        var builder;
        return builder = JasmineArgumentsBuilder().getBuilder(this), builder.addMatcher(new JasmineArgumentsMatcher(function(actual) {
            var expectedKey, expectedValue;
            if (null === actual || "object" != typeof actual) return !1;
            for (expectedKey in expected_items) if (expectedValue = expected_items[expectedKey], 
            !(expectedKey in actual && actual[expectedKey] === expectedValue)) return !1;
            return !0;
        }, "<Contains item(s) " + jasmine.pp(expected_items) + ">"));
    };
}.call(this);