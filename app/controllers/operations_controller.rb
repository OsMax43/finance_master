class OperationsController < ApplicationController
  def index
    @pagy, @operations = pagy Operation.all.order(:odate)
  end

  def new
    @operation = Operation.new
  end

  def create
    @operation = Operation.new(operation_params)
    if @operation.save
      flash[:notice] = "Транзакція успішна!"
      redirect_to operations_path
    else
      render :new
    end

  end

  def destroy
    @operation = Operation.find params[:id]
    @operation.destroy
    flash[:alert] = "Транзакція #{@operation.id} видалена!"
    redirect_to operations_path
  end

  def edit
    @operation = Operation.find params[:id]
    
  end

  def update
    @operation = Operation.find params[:id]
    if @operation.update(operation_params)
      flash[:notice] = "Транзакція #{@operation.id} оновлена!"
      redirect_to operations_path
    else
      render :edit
    end
  end



  private

  def operation_params
    params.require(:operation).permit(:amount, :description, :odate, :otype, :category_id)
  end

  # def category_select
    
  #   @category_select = Category.pluck(:id, :name)
  # end

end