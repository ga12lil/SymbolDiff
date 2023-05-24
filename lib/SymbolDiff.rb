# frozen_string_literal: true

require_relative "SymbolDiff/version"
require_relative "differentiate_polynomial"

module SymbolDiff
  extend self
  class Error < StandardError; end

  def diff(input,differentiate_variable)
    differentiate_polynomial(input,differentiate_variable)
  end
end
