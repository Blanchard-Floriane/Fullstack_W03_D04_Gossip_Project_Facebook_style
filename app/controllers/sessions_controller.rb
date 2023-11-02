class SessionsController < ApplicationController
  def new #correspond à la page de login
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/", notice: "Connexion Success"

    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy #correspond au logout
    session.delete(:user_id) #pas d'arobase car pas un objet
    redirect_to "/"
  end
end
