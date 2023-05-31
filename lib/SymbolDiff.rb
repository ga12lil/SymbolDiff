# frozen_string_literal: true

require_relative "SymbolDiff/version"
require_relative "differentiate_polynomial"

module SymbolDiff
  extend self
  class Error < StandardError; end

  def diff(input,differentiate_variable)
    str = differentiate_polynomial(input,differentiate_variable)
    if(str!= nil)
      if(str[0] == '+')
        str = str[1..-1]
      end
    end
    return str
  end

end
