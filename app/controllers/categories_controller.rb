class CategoriesController < ApplicationController
  
  def index
    @pagy, @categories = pagy Category.all
  end


  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Категорія #{@category.name} створена!"
      redirect_to categories_path
    else
      render :new
    end
    
  end
  
  def edit
    @category = Category.find params[:id]
  end

  def update
    @category = Category.find params[:id]
    if @category.update(category_params)
      flash[:notice] = "Категорія #{@category.name} оновлена!"
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    flash[:alert] = "Категорія #{@category.name} видалена!"
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end

end