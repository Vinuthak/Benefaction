class IncomesController < ApplicationController
	def index
		@account = Account.find(params[:account_id])
		@incomes = Income.search(params[:name],params[:amount])
		@total = Income.sum(:amount)
	end

	def new
		@account = Account.find(params[:account_id])
		@income = Income.new
	end

	def create
		@account = Account.find(params[:account_id])
        @income = Income.create(income_params.merge({"account_id" => params[:account_id]}))
        if @income.save
           redirect_to account_incomes_path
        else 
        	render action: :new
        end
	end

	def edit
		@account = Account.find(params[:account_id])
		@income = Income.find(params[:id])
	end
	def show
		@account = Account.find(params[:account_id])
		@income = Income.find(params[:id])
	end

	def update
		@income = Income.find(params[:id])
		if @income.update_attributes(income_params)
			redirect_to account_incomes_path
		else
			render action: :new
		end

	end



	def destroy
		@income = Income.find(params[:id])
		@income.destroy
		redirect_to account_incomes_path
	end

	private
	def income_params
		params.require(:income).permit(:name,:amount,:purpose,:account_id)
	end
end
