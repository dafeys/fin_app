class OperationsController < ApplicationController
  before_action :set_operation, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  def index
    @pagy, @operations = pagy(current_user.operations.order(odate: :desc), items: 10)
    #@operations = current_user.operations.order(odate: :desc).page params[:page]
    #@operations = Operation.includes(:category).where(category: { user_id: current_user }).order(odate: :desc).page params[:page]
  end

  def show
  end

  def new
    @operation = Operation.new
  end

  def edit
  end

   def create
    @operation = Operation.new(operation_params)

    respond_to do |format|
      if @operation.save
        format.html { redirect_to operation_url(@operation), notice: "Operation was successfully created." }
        format.json { render :show, status: :created, location: @operation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @operation.update(operation_params)
        format.html { redirect_to operation_url(@operation), notice: "Operation was successfully updated." }
        format.json { render :show, status: :ok, location: @operation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

   def destroy
    @operation.destroy

    respond_to do |format|
      format.html { redirect_to operations_url, notice: "Operation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operation
      @operation = Operation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def operation_params
      params.require(:operation).permit(:amount, :odate, :description, :category_id)
    end
end
