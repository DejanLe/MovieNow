class MoviersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movier, only: [:show, :edit, :update, :destroy]

  # GET /moviers
  # GET /moviers.json
  def index
    @moviers = Movier.all.order("created_at DESC")
  end

  # GET /moviers/1
  # GET /moviers/1.json
  def show
  end

  # GET /moviers/new
  def new
    @movier = current_user.moviers.build
    @categories = Category.all.map{ |c| [c.name, c.id]}
  end

  # GET /moviers/1/edit
  def edit
    @categories = Category.all.map{ |c| [c.name, c.id]}
  end

  # POST /moviers
  # POST /moviers.json
  def create
    @movier = current_user.moviers.build(movier_params)
    @movier.category_id = params[:category_id]
    respond_to do |format|
      if @movier.save
        format.html { redirect_to @movier, notice: 'Movier was successfully created.' }
        format.json { render :show, status: :created, location: @movier }
      else
        format.html { render :new }
        format.json { render json: @movier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moviers/1
  # PATCH/PUT /moviers/1.json
  def update
    respond_to do |format|
      if @movier.update(movier_params)
        format.html { redirect_to @movier, notice: 'Movier was successfully updated.' }
        format.json { render :show, status: :ok, location: @movier }
      else
        format.html { render :edit }
        format.json { render json: @movier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moviers/1
  # DELETE /moviers/1.json
  def destroy
    @movier.destroy
    respond_to do |format|
      format.html { redirect_to moviers_url, notice: 'Movier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movier
      @movier = Movier.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movier_params
      params.require(:movier).permit(:category_id, :title, :description, :year, :director, :actors, :movierimage)
    end
end
