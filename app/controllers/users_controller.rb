class UsersController < ApplicationController
	def new
		@account = Account.find(params[:account_id])
		@user = User.new
	end

	def index
		# puts "****** "
		# p params
		# puts "****** "
		# puts params[:firstname]
		# puts "****** "
		# puts params[:place]
		# puts "****** "

		@account = Account.find(params[:account_id])
		@users = User.search(params[:firstname],params[:place])# equal to select * from users where firstname = ""place = "",order by firstname as it is used in model
		
	end

	def create
		@account = Account.find(params[:account_id])
		@user = User.create(user_params.merge({"account_id" => params[:account_id]}))
		if @user.save
			redirect_to account_users_path
		else
			render action: :new 
		end
	end

	def edit
		@account = Account.find(params[:account_id])
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			redirect_to account_users_path
		else
			render action: :edit
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to account_users_path																		
	end

	private
	def user_params
		params.require(:user).permit(:firstname,:lastname,:gender,:place)
	end
end
