// Generated by CoffeeScript 1.6.1
(function() {

  describe('When jasmine-arguments is integrated with jasmine', function() {
    beforeEach(function() {
      return spyOn(console, 'log');
    });
    it('should be possible to match a spy argument partially with startsWith', function() {
      var message;
      message = 'this is a message';
      console.log(message);
      return expect(console.log).toHaveBeenCalledWith(jasmine.Arg().startsWith(message.slice(0, 3)));
    });
    it('should not interfer with itself when called twice', function() {
      var message1, message2;
      message1 = 'this is a message';
      message2 = 'i forgot this part';
      console.log(message1, message2);
      return expect(console.log).toHaveBeenCalledWith(jasmine.Arg().startsWith(message1.slice(0, 3)), jasmine.Arg().startsWith(message2.slice(0, 4)));
    });
    return it('should be possible to stack matchers');
  });

}).call(this);
