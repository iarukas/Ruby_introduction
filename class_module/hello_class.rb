class HelloWorld
  def initialize(myname = "Ruby")
    @name = myname
  end

  def hello
    puts "Hello,world.I am #{@name}."
  end

  def name
    @name
  end

  def name=(value)
    @name = value
  end
end

bob = HelloWorld.new("Bob")
alice = HelloWorld.new("alice")
ruby = HelloWorld.new

bob.hello
p bob.name
bob.name = "Robert"
p bob.name
