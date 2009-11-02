class Item
  attr_accessor :description, :completion_datetime
  
  def complete!
    completion_datetime = DateTime.now 
  end

end

class ItemWithEstimation < Item
  attr_accessor :estimated_time_to_completion

  def itnitalize(estimated=0)
    estimated_time_to_completion = estimated
  end

  def log_work(hours)
    estimated_time_to_completion -= hours
  end

end

item = ItemWithEstimation.new
item.complete!
item.log_work(3)
