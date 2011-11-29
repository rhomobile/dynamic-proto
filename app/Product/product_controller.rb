require 'vendor/lib/base_controller'

class ProductController < BaseController
  
  def index_hook
    @total_retail_value = 0.00
    @action = :index_hook
    @products.map {|product| @total_retail_value += product.retail.to_f}
  end
  
end
