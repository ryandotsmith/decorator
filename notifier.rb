require 'decorator'

class Notifier
  attr_accessor :message
  include Decorator

  def ping(person="@ryandotsmith")
    puts "#{person}: #{@message}"
  end

end
