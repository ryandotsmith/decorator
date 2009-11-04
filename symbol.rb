class Symbol
  def to_class
    Kernel.const_get(ActiveSupport::Inflector::camelize(self))
  end
end

