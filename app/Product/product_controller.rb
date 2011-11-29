require 'vendor/lib/BaseProduct/base_product_controller'

class ProductController < BaseProductController
  
  def index_hook
    @total_retail_value = 0.00
    @action = :index_hook
    @products.map {|product| @total_retail_value += product.retail.to_f}
    puts @products.last.my_base_method if @products.size > 0
  end
  
end
