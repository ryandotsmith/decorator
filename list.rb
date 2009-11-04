require 'item.rb'

class List
  attr_accessor :items

  def initialize 
    @items = []
  end

end


list = List.new
list.items << Item.with( :notifier ) 
list.items << Item.with(:estimation, :notifier ) 

list.items.first.message = "just finished the project"
list.items.first.ping("@ryandotsmith")

list.items.last.estimated_time_to_completion = 10
list.items.last.log_work(4)
