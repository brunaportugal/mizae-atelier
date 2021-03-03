class Admin::CollectionsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @collections = Collection.all
  end

  def show
    @collection = Collection.find(params[:id])
    @products = Product.where(params[:colletion_id])
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(collection_params)
    if @collection.save
      flash[:notice] = "Coleção adicionada!"
      redirect_to admin_collections_path
    else
      flash[:notice] = "Coleção não pode ser deixada em branco"
      render 'admin/collections/new'
    end
  end

  def edit
    @collection = Collection.find(params[:id])
  end

  def update
    @collection = Collection.find(params[:id])
    if @collection.update(collection_params)
      flash[:notice] = "Coleção atualizada!"
      redirect_to admin_collections_path
    else
      render :edit
    end
  end

  def destroy
    Collection.destroy(params[:id])
    flash[:notice] = "Coleção deletada!"
    redirect_to admin_collections_path
  end

  private

  def collection_params
    params.require(:collection).permit(:name)
  end
end
