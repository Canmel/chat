class MessagesController < ApplicationController
  before_action :authenticate_user!, except: [:create, :show_all]
  skip_before_action :verify_authenticity_token, only: [:create, :show_all]

  def index
    params[:q]||= ActionController::Parameters.new
    params[:q][:status_eq] ||= Message.statuses[:examine]
    params[:q][:s] = 'id desc'
    @q = Message.search(params[:q])
    @messages = @q.result.page(@page).per(@page_size)
    @messages.total_count
  end

  def to_examine
    @message = Message.find(params[:id])
    if params[:showable].present?
      @message.update(showable: Message.showables[:show], status: Message.statuses[:active])
    else
      @message.update(showable: Message.showables[:hide], status: Message.statuses[:active])
    end
    redirect_to :messages
  end

  def create
    @message = Message.new(message_params)
    respond_to do |format|
      format.json do
        response.set_header('Access-Control-Allow-Origin', "*")
        if @message.save
          render json: @message.to_json
        else
          render json: @message.errors.to_json
        end
      end
      format.html do
        @message.status = Message.statuses[:active]
        @message.showable = Message.showables[:show]
        if @message.save
          redirect_to messages_path("q[status_eq]": 1, "q[showable_eq]": 1)
        else
          render :new
        end
      end
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.update!(status: Message.statuses[:archived])
    redirect_to :messages
  end

  def show_all
    @messages = Message.active.show.order("created_at desc")[0,30].reverse
    response.set_header('Access-Control-Allow-Origin', "*")
    respond_to do |format|
      format.json do
        render json: @messages
      end
    end
  end

  def new
    @message = Message.new
  end

  private
  def message_params
    params.require(:message).permit(:context, :showable, :userid)
  end
end
