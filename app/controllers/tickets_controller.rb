class TicketsController < ApplicationController
  def new
    @ticket = Ticket.new
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def create
    @ticket = Ticket.new(ticket_params)
    redirect_to @ticket if @ticket.save
    redirect_to search_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:user_name, :user_passport,
                                   :train_id, :first_station_id,
                                   :last_station_id)
  end
end