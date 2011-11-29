# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
require 'vendor/lib/BaseProduct/base_product'

class Product
  include BaseProduct
  
  # Uncomment the following line to enable sync with Product.
  # enable :sync

  #add model specifc code here
  
  def my_base_method
    "inside product base method"  
  end
end