(window ? global).property = 'global context'
@property = 'surrounding context'
class Foo
    constructor: -> @property = 'instance context'
    bar: -> console.log @property

foo = new Foo
bar = foo.bar
foo.bar()
bar()