require 'Date'

class Item
  attr_accessor :description, :completion_datetime
  
  def complete!
    @completion_datetime = DateTime.now 
    puts "complete!"
  end

end

Item.class_eval do
  attr_accessor :estimated_time_to_completion

  def initialize(estimated=0)
    @estimated_time_to_completion = estimated
  end

  def log_work(hours)
    @estimated_time_to_completion -= hours
    puts "working...."
  end

end

item = Item.new
item.complete!
item.log_work(3)
