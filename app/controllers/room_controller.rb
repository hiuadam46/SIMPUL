class RoomController < ApplicationController
  def index
    @room = Room.find(params[:key_room])
    @users = User.all()
    @current_user = current_user
    @chats = Chat.select("chats.message, chats.created_at ,users.email as email").joins("LEFT JOIN rooms ON chats.key_room = rooms.id").joins("LEFT JOIN users ON chats.key_user = users.id").where("chats.key_room = ?", params[:key_room])
  end

  def sendThisMessage
    json_params = JSON.parse(request.body.read)
    time_now = Time.now
    formatted_time = time_now.strftime("%Y-%m-%d %H:%M:%S.%6N")
    @chat = Chat.new(key_room: json_params['key_room'], key_user: current_user.id, message: json_params['message'], created_at: time_now, updated_at: time_now)
    if @chat.save
      render json: @chat, status: :created
    else
      render json: @chat.errors, status: :unprocessable_entity
    end
  end

  def getThisMessage
    @chats = Chat.select("chats.message, chats.created_at ,users.email as email").joins("LEFT JOIN rooms ON chats.key_room = rooms.id").joins("LEFT JOIN users ON chats.key_user = users.id").where("chats.key_room = ?", params[:key_room])
    render json: @chats
  end

  
end
