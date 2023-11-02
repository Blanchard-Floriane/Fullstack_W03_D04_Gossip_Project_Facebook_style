class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    city_name = params[:city_name]
    zip_code = params[:zip_code]

    city = City.find_by(name: city_name, zip_code: zip_code)

    if city #si déjà dans ma BDD
      city_id = city.id
    else
      new_city = City.create(name: city_name, zip_code: zip_code)
      city_id = new_city.id 
    end

    @user = User.create(
      'first_name' => params[:first_name],
      'last_name' => params[:last_name],
      'description' => params[:description],
      'email' => params[:email],
      'age' => params[:age],
      'city_id' => city_id,
      'password' => params[:password])

    if @user.save
      flash[:success] = "Welcome!"
      redirect_to "/"
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:gossip).permit(:first_name, :last_name, :email, :password_digest)
  end

end
