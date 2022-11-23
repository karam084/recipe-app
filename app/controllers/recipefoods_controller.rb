class RecipefoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipefood, only: %i[show edit update destroy]

  def index
    @recipefoods = Recipefood.all
  end

  def show; end

  def new
    @recipefood = Recipefood.new
  end

  def edit; end

  def create
    @recipefood = Recipefood.new(recipefood_params)

    respond_to do |format|
      if @recipefood.save
        format.html { redirect_to recipefood_url(@recipefood), notice: 'Recipefood was successfully created.' }
        format.json { render :show, status: :created, location: @recipefood }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipefood.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @recipefood.update(recipefood_params)
        format.html { redirect_to recipefood_url(@recipefood), notice: 'Recipefood was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipefood }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipefood.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipefood.destroy

    respond_to do |format|
      format.html { redirect_to recipefoods_url, notice: 'Recipefood was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_recipefood
    @recipefood = Recipefood.find(params[:id])
  end

  def recipefood_params
    params.require(:recipefood).permit(:quantity)
  end
end
