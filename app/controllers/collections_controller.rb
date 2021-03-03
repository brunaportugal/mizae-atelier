class CollectionsController < ApplicationController
  def index
    @collections = Collection.all
  end

  def show
    @collection = Collection.find(params[:id])
    @products = Product.where(params[:colletion_id])
  end
end
