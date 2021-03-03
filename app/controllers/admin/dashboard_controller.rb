class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['BASIC_AUTH_CREDENTIAL_USERNAME'], password: ENV['BASIC_AUTH_CREDENTIAL_PASSWORD']

  
  def show
    @product_count = Product.count
    @category_count = Category.count
  end 

end
