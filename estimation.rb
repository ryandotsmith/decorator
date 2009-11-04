require 'decorator'

class Estimation
  attr_accessor :estimated_time_to_completion
  include Decorator  

  def log_work(hours)
    @estimated_time_to_completion -= hours
    puts "working...."
    return true
  end

end
