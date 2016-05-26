class CatalogController < ApplicationController
  def index
    @categories = Category.with_product
    if params[:categories]
      @selected_categories = Category.where id: params[:categories]
      @products = Product.where id: @selected_categories.map(&:all_product_ids)
    else
      @products = Product.all
    end
  end
end
