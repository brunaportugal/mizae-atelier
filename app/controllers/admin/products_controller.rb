class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @products = Product.all
  end

  def new
    @collection = Collection.find(params[:collection_id])
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @collection = Collection.find(params[:collection_id])
    @product.collection = @collection
    if @product.save
      flash[:notice] = "Produto adicionado!"
      redirect_to admin_collection_path(@collection)
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Produto atualizado!"
      redirect_to admin_product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Produto deletado!"
    redirect_to admin_collections_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :availability, :category)
  end
end
