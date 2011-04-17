$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'
require 'test/unit'
require 'axe'

class Test::Unit::TestCase
  def Axe(args)
    Axe::Swing.new(*args.split(' '))
  end

  def assert_command(input, expected)
    assert_equal expected, Axe(input).command
  end
end
