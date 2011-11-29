require 'rho/rhocontroller'
require 'helpers/browser_helper'
require 'vendor/lib/base_product'

class BaseController < Rho::RhoController
  include BrowserHelper
  
  def index_hook; end

  # GET /Product
  def index
    @products = Product.find(:all)
    @total_msrp_value = 0.00
    @products.map {|product| @total_msrp_value += product.msrp.to_f}    
    index_hook
    render :action => @action || :index, :back => '/app'
  end

  # GET /Product/{1}
  def show
    @product = Product.find(@params['id'])
    if @product
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Product/new
  def new
    @product = Product.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Product/{1}/edit
  def edit
    @product = Product.find(@params['id'])
    if @product
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end
  
  def product_partial_edit(product)
    load_erb("product_partial_edit", product)
  end

  # POST /Product/create
  def create
    @product = Product.create(@params['product'])
    redirect :action => :index
  end

  # POST /Product/{1}/update
  def update
    @product = Product.find(@params['id'])
    @product.update_attributes(@params['product']) if @product
    redirect :action => :index
  end

  # POST /Product/{1}/delete
  def delete
    @product = Product.find(@params['id'])
    @product.destroy if @product
    redirect :action => :index  
  end
  
  def load_erb(path,obj)
    @path = path
    @obj = obj

    require 'rho/rhoviewhelpers'
    
    file = File.join(File.dirname(File.join(__rhoGetCurrentDir(), __FILE__)),
                         "#{@path}_erb.iseq")

    retval = ""
    retval = eval_compiled_file(file, binding) if File.exist? file
    retval
  end
end
