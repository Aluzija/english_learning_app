class PacketsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @packet = Packet.new
  end

  def create
    @packet = Packet.new(packet_params)
    @packet.user_id = current_user.id
    if @packet.save
      redirect_to user_packets_path(current_user.id)
    else
      render "index"
    end
  end

  def destroy
    packet = Packet.find(params[:id])
    packet.destroy
    redirect_to user_packets_path(current_user.id)
  end

  private

  def packet_params
    params.require(:packet).permit(:name, :user_id)
  end

end
