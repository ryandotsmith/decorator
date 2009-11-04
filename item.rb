require 'rubygems'
require 'active_support/inflector'

class Symbol
  def to_class
    Kernel.const_get(ActiveSupport::Inflector::camelize(self))
  end
end

module Decorator
  def initialize(decorated)
    @decorated = decorated
  end
  def method_missing(method, *args)
    args.empty? ? @decorated.send(method) : @decorated.send(method, args)
  end
end

class Estimation
  attr_accessor :estimated_time_to_completion
  include Decorator  

  def log_work(hours)
    @estimated_time_to_completion -= hours
    puts "working...."
    return true
  end

end

class Notifier
  attr_accessor :message
  include Decorator

  def ping(person="@ryandotsmith")
    puts "#{person}: #{@message}"
  end

end

class DecoratedItem
  include Decorator
end

class Item
  attr_accessor :description, :completion_datetime

  def self.with(*extras)
    extras << :decorated_item
    extras.inject(self.new) { |memo, extra| memo = extra.to_class.new(memo) }
  end


  def initialize 
    @completion_datetime = Date.new
    @description = "new todo item"
  end

  def complete!
    @completion_datetime = Date.today
    puts "complete!"
  end

end


item = Item.with :estimation, :notifier
item.estimated_time_to_completion = 10
item.log_work(4)
item.ping

