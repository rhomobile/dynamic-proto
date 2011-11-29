module BaseProduct
  
  def self.included(model)
    model.extend Rhom::PropertyBag
  end
  
  def my_base_method
    "base method!"
  end
end