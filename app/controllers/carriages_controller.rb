class CarriagesController < ApplicationController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:new, :create]

  def index
    @carriages = Carriage.all
  end

  def show
  end

  def new
    @carriage = Carriage.new
  end

  # def create
  #   @carriage = Carriage.new(carriage_params)
  #
  #   if @carriage.save
  #     redirect_to carriages_path(@carriage)
  #     #edit_carriage_path(@carriage, notice: 'Carriage was successfully created.')
  #   else
  #     render :new
  #   end
  # end

  def create
    @carriage = @train.carriages.new(carriage_params)

    if @carriage.save
      redirect_to @train
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @carriage.update(carriage_params)
      redirect_to @carriage
    else
      render :edit
    end
  end

  def destroy
    @carriage.destroy
    redirect_to train_carriages_path
  end

  private

  def set_train
    @train = Train.find(params[:train_id])
  end

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def carriage_params
    params.require(:carriage).permit(:number, :type,
                                     :top_seats, :bottom_seats,
                                     :sitting_seats, :side_bottom_seats,
                                     :side_top_seats, :train_id)
  end
end