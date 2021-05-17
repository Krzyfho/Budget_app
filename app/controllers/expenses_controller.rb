class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    @expenses = Expense.all
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      flash[:success] = t(:'flash.controller.good_create')
      redirect_to expenses_path
    else
      flash.now[:alert] = t(:'flash.controller.bad_create')
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :price, :paid_on)
  end
end
