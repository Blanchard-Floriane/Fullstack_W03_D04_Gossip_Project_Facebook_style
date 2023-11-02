class SessionsController < ApplicationController
  def new #correspond à la page de login
    id = session[:user_id]
    @user = User.find(id) #et hop, cette variable @user est l'instance User contenant toutes les infos de l'utilisateur connecté
  end

  def create #qui effectuera l'authentification (traitement des informations saisies dans la page login et sauvegarde de l'info de l'utilisateur connecté dans session)
    # cherche s'il existe un utilisateur en base avec l’e-mail
    user = User.find_by(email: email_dans_ton_params)

    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe
    if user && user.authenticate(password_dans_ton_params)
      session[:user_id] = user.id
      # redirige où tu veux, avec un flash ou pas

    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy #correspond au logout
  end
end
