class Logger
  attr_accessor :prefix, :separator #generates getter/setter

  #class variable
  @@prefix = "rrr"
  @@separator = "->"

  # The constructor.
  def initialize(prefix = "bzzt", separator = ":")
    @prefix = prefix
    @separator = separator
  end

  # A custom method.
  def show(message)
    puts "#{@prefix}#{separator}#{message}"
  end

  # to string
  def to_s
    "prefix:#{@prefix} separator:#{@separator}"
  end

  # class method
  def self.show(message)
    puts "#{@@prefix}#{@@separator}#{message}"
  end

end
