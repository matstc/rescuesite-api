class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show, :update, :destroy]

  # GET /animals
  # GET /animals.json
  def index
    @rescue = Rescue.find(params[:rescue_id])
    @animals = @rescue.animals

    render json: @animals
  end

  # GET /animals/1
  # GET /animals/1.json
  def show
    @animal = Animal.find(params[:id])
    render json: @animal
  end

  # POST /animals
  # POST /animals.json
  def create
    @animal = Animal.new(animal_params)

    if @animal.save
      render json: @animal, status: :created, location: @animal
    else
      render json: @animal.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /animals/1
  # PATCH/PUT /animals/1.json
  def update
    @animal = Animal.find(params[:id])

    if @animal.update(animal_params)
      head :no_content
    else
      render json: @animal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /animals/1
  # DELETE /animals/1.json
  def destroy
    @animal.destroy

    head :no_content
  end

  private

    def set_animal
      @animal = Animal.find(params[:id])
    end

    def animal_params
      params.require(:animal).permit(:name, :breed, :sex, :dob, :rescue_id)
    end
end
