class PacketsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @packet = Packet.new
  end

  def create
    @user = User.find(params[:user_id])
    @packet = Packet.new(packet_params)
    @packet.user_id = params[:user_id]
    if @packet.save
      redirect_to user_packets_path(params[:user_id])
    else
      render "index"
    end
  end

  def destroy
    packet = Packet.find(params[:id])
    packet.destroy
    redirect_to user_packets_path(params[:user_id])
  end

  private

  def packet_params
    params.require(:packet).permit(:name, :user_id)
  end

end
