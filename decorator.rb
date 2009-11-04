require 'rubygems'
require 'symbol'
require 'active_support/inflector'


module Decorator
  def initialize(decorated)
    @decorated = decorated
  end
  def method_missing(method, *args)
    args.empty? ? @decorated.send(method) : @decorated.send(method, args)
  end
end

