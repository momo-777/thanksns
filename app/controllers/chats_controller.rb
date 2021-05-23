class ChatsController < ApplicationController
  before_action :authenticate_user!

    def index
      @chats = Chat.all
    end
   
    def new
      @chat = Chat.new
    end

    def create
      chat = Chat.new(chat_params)
      
      chat.user_id = current_user.id

      if chat.save
        redirect_to :action => "index"
      else
        redirect_to :action => "new"
      end
    end

    def show
      @chat = Chat.find(params[:id])
      @comments = @chat.comments
      @comment = Comment.new
    end
  
    def edit
      @chat = Chat.find(params[:id])
    end

    def update
      chat = Chat.find(params[:id])
      if chat.update(chat_params)
        redirect_to :action => "show", :id => chat.id
      else
        redirect_to :action => "new"
      end
    end

    def destroy
      chat = Chat.find(params[:id])
      chat.destroy
      redirect_to action: :index
    end

    def js_sample
    end
    
    private
    def chat_params
      params.require(:chat).permit(:content, :image, :mention)
    end
end

