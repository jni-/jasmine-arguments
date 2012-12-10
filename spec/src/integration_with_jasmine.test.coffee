describe 'When jasmine-arguments is integrated with jasmine', ->

  beforeEach ->
    spyOn(console, 'log')

  it 'should be possible to match a spy argument partially with startsWith', ->
    message = 'this is a message'

    console.log(message)

    expect(console.log).toHaveBeenCalledWith(jasmine.Arg().startsWith(message[0..2]))

  it 'should not interfer with itself when called twice', ->
    message1 = 'this is a message'
    message2 = 'i forgot this part'

    console.log(message1, message2)

    expect(console.log).toHaveBeenCalledWith(jasmine.Arg().startsWith(message1[0..2]), jasmine.Arg().startsWith(message2[0..3]))

  it 'should be possible to stack matchers'