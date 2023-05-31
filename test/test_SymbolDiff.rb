require_relative "../lib/SymbolDiff.rb"
require "test/unit"

class SymbolDiffTest < Test::Unit::TestCase

  def test_function
    assert_equal "2*x", SymbolDiff.diff("x^2", 'x')
    assert_equal "8*x+6", SymbolDiff.diff("4*x^2+6*x+6", 'x')
    assert_equal "2*x+6*x^2", SymbolDiff.diff("x^2+2*x^3+6", 'x')
    assert_equal nil, SymbolDiff.diff("rubyruby", 'x')
    assert_equal nil, SymbolDiff.diff("2*x + 25", 'x')
    assert_equal "0", SymbolDiff.diff("x^3", 'y')
    assert_equal "2+12*y", SymbolDiff.diff("2*y+2*x^3+6*y^2", 'y')
    assert_equal nil, SymbolDiff.diff("", 'y')
    assert_equal nil, SymbolDiff.diff("2*x^2+15", '')
    assert_equal "0", SymbolDiff.diff("15*3+25+2", 'x')
    assert_equal "-2+12*y", SymbolDiff.diff("-2*y+2*x^3+6*y^2", 'y')
    assert_equal "1", SymbolDiff.diff("x+y+z", 'z')
    assert_equal "0.5", SymbolDiff.diff("0.5*x", 'x')
  end
end
