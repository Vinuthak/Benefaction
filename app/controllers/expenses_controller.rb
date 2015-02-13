class ExpensesController < ApplicationController
	def index
		@account = Account.find(params[:account_id])
		@expenses = Expense.all
	end

	def new
		@account = Account.find(params[:account_id])
		@expense = Expense.new
	end

	def create
		@account = Account.find(params[:account_id])
		@expense = Expense.create(expense_params.merge({"account_id" => params[:account_id]}))
		if @expense.save
			redirect_to account_expenses_path
		else
			render action: :new
		end
		
	end

	def edit
		@account = Account.find(params[:account_id])
		@expense = Expense.find(params[:id])
	end

	def update
		@expense = Expense.find(params[:id])
		if @expense.update_attributes(expense_params)
			redirect_to account_expenses_path
		else
			render action: :new
		end
	end
		
	def destroy
		@expense = Expense.find(params[:id])
		@expense.destroy
		redirect_to account_expenses_path
	end
	
	private 
	def expense_params
		params.require(:expense).permit(:amount,:purpose,:account_id)
	end

end
