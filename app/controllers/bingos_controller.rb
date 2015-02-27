class BingosController < ApplicationController
	def index
		@account = Account.find(params[:account_id])
		@bingos = Bingo.search(params[:firstname])
	end

	def new
		@account = Account.find(params[:account_id])
		@bingo = Bingo.new
	end

	def create
		@account = Account.find(params[:account_id])
		@bingo = Bingo.create(bingo_params)
		if @bingo.save
			redirect_to account_bingos_path
		else
			render action: :new
		end

	end

	def edit
		@account = Account.find(params[:account_id])
		@bingo = Bingo.find(params[:id])
	end

	def update
		@bingo = Bingo.find(params[:id])
		if @bingo.update_attributes(bingo_params)
			redirect_to account_bingos_path
		else
			render action: :new
		end
	end

	def destroy
		@bingo = Bingo.find(params[:id])
		
		@bingo.destroy
		redirect_to account_bingos_path

	end

	private
	def bingo_params
		params.require(:bingo).permit(:firstname,:lastname,:gender,:amount,:date,:account_id)
	end
end
