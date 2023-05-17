# frozen_string_literal: true

require_relative "SymbolDiff/version"

module SymbolDiff
  extend self
  class Error < StandardError; end

  def hello
    "hello"
  end
end
