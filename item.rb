require 'Date'

class Item
  attr_accessor :description, :completion_datetime

  def initialize 
    @completion_datetime = Date.new
    @description = "new todo item"
  end

  def complete!
    @completion_datetime = Date.today
    puts "complete!"
  end

end

class ItemWithEstimation < Item
  attr_accessor :estimated_time_to_completion
  
  def initialize(estimated=0) 
    super()
    @estimated_time_to_completion = estimated
  end

  def log_work(hours)
    @estimated_time_to_completion -= hours
    puts "working...."
  end

end


item = ItemWithEstimation.new
puts item.description
item.complete!
item.log_work(4)


