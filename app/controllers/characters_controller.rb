class CharactersController < ApplicationController
  def index
    @characters = Character.all
  end

  def show
    @character = Character.find(params[:id])
  end

  def new
    @house = House.find(params[:house_id])
    @character = @house.characters.build
  end

  def create
    @house = House.find(params[:house_id])
    @character = @house.characters.create(character_params)

    redirect_to house_path(@house)
  end

  def edit
    @house = House.find(params[:house_id])
    @character = @house.characters.find(params[:id])
  end

  def update
    @house = House.find(params[:house_id])
    @character = @house.characters.find(params[:id])
    @character.update(character_params)

    redirect_to house_character_path(@character.house, @character)
  end

  def destroy
    @house = House.find(params[:house_id])
    @character = Character.find(params[:id])
    @character.destroy

    redirect_to house_path(@house)
  end

  private
  def character_params
    params.require(:character).permit(:name, :good_guy, :img_url)
  end
end
