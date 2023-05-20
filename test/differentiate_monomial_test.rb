require_relative "differentiate_monomial"
require "test/unit"

class DifferentiateMonomialTest < Test::Unit::TestCase
  
  def test_no_multiplier
    assert_equal "2*x", differentiate_monomial("x^2", 'x')
    assert_equal "6*x^5", differentiate_monomial("x^6", 'x')
    assert_equal "1", differentiate_monomial("x", 'x')
  end

  def test_no_power
    assert_equal "2", differentiate_monomial("2*x", 'x')
    assert_equal "4.6", differentiate_monomial("4.6*x", 'x')
    assert_equal "8", differentiate_monomial("8*x", 'x')
  end

  def test_no_variable
    assert_equal "", differentiate_monomial("8", 'x')
    assert_equal "", differentiate_monomial("1.3", 'y')
    assert_equal "", differentiate_monomial("5.1", 'z')
  end
  
  def test_different_letters
    assert_equal "4*y", differentiate_monomial("2*y^2", 'y')
    assert_equal "5*f^4", differentiate_monomial("f^5", 'f')
    assert_equal "2", differentiate_monomial("2*t", 't')
  end

  def test_differentiate_wrong_variable
    assert_equal "", differentiate_monomial("2*y^2", 'x')
    assert_equal "", differentiate_monomial("x^2", 'z')
    assert_equal "", differentiate_monomial("n", 'r')
  end

  def test_trash_input_results_in_nil
    assert_equal nil, differentiate_monomial("ya like jazz?", 'x')
    assert_equal nil, differentiate_monomial("ya^2", 'y')
    assert_equal nil, differentiate_monomial("x^2.12", 'x')
    assert_equal nil, differentiate_monomial("3*x^^5", 'x')
    assert_equal nil, differentiate_monomial("7**x^2", 'x')
    assert_equal nil, differentiate_monomial("1+x^4", 'x')
  end
  
end