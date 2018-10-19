class RepliesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reply, only: [:edit, :update, :show, :destroy]
  before_action :set_topic, only: [:create, :edit, :show, :update, :destroy]

  def create
    @reply = @topic.replies.create(params[:reply].permit(:body, :topi_id))
    @reply.user_id = current_user.id

    respond_to do |format|
      if @reply.save
        format.html { redirect_to topic_path(@topic) }
        format.js # renders create.js.erb
      else
        format.html { redirect_to topic_path(@topic), notice: "Reply did not save. Please try again."}
        format.js
      end
    end
  end

  def new
  end


  def destroy
    @reply = @topic.replies.find(params[:id])
    @reply.destroy
    redirect_to topic_path(@topic)
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @reply = @topic.replies.find(params[:id])
  end

  def update
    @reply = @topic.replies.find(params[:id])
     respond_to do |format|
      if @reply.update(reply_params)
        format.html { redirect_to topic_path(@topic), notice: 'Reply was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  private

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def set_reply
    @reply = Reply.find(params[:id])
  end

  def reply_params
    params.require(:reply).permit(:body)
  end
end
