class SessionsController < ApplicationController
	protect_from_forgery with: :null_session
	def create
		user = User.find_by(email:login_params[:email])
		if !user
			flash[:login_errors] = ['User does not exist.']
			redirect_to '/'
		elsif user && user.authenticate(login_params[:password])
			session[:user_id] = user.id
			redirect_to '/calendar'
		else
			flash[:login_errors] = ['Incorrect credentials']
			redirect_to '/'
		end
	end

	private
		def login_params
			params.require(:login).permit(:email, :password)
		end
end
