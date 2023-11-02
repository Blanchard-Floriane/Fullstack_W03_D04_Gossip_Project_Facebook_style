class CitiesController < ApplicationController
  def show
    @city = City.find(params[:id])
    @users = @city.users
    @gossips = Gossip.joins(:user).where(users: {city_id: @city.id})
  end

  #pour ce qui est de la création de ville, comme elle se fait via le formulaire User, ce n'est pas ici que l'on voit le code
end
