require 'decorator'

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
