class AccountsController < ApplicationController
	http_basic_authenticate_with name: "vinu",password: "nithya",
	except: [:index,:show]
	def new
		@account = Account.new
	end

	def create
		@account = Account.create(account_params)
		if @account.save
			redirect_to accounts_path
		else
			render action: :new
		end
	end

	def user_list
		@account = Account.find(params[:id])
		@users = @account.users
	end

	def index
		if params[:search]
			@accounts = Account.search(params[:search])
		else
			@accounts = Account.all
		end

	end

	def details
		@account = Account.find(params[:id])
		@bingos = Bingo.all
	end
	

	def expense_list
		@account = Account.find(params[:id])
		@expenses = Expense.all
	end

	def income_list
		@account = Account.find(params[:id])
		@incomes = Income.all
	end

	def update
		@account = Account.find(params[:id])
		if @account.update_attributes(account_params)
			redirect_to accounts_path
		else
			render action: :new
		end
	end

	

	def edit
		@account = Account.find(params[:id])
	end

	def show
		@account = Account.find(params[:id])
		@total_income = Income.sum(:amount)
		@total_expense = Expense.sum(:amount)
		@balance = @total_income-@total_expense
	end

	def destroy
		@account = Account.find(params[:id])
		@account.destroy
		redirect_to accounts_path
		
	end

	private
	def account_params
		params.require(:account).permit(:name,:description,:place,:registration_number,:user_name)
	end
end
