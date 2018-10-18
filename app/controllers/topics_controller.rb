class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  before_action :find_categories, only: [:index, :show, :new, :edit]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @topics = Topic.all.order('created_at desc')
  end

  def show
    @topics = Topic.all.order('created_at desc')
  end

  def new
    @topic = current_user.topic.build
  end

  def edit
  end

  def create
    @topic = current_user.topics.build(topics_params)

    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: 'Topic was successfully created.' }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render :new }
        format.json { render json: @topics.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @topic.update(topics_params)
        format.html { redirect_to @topic, notice: 'Topic was successfully updated' }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to topic_url, notice: 'Topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def find_categories
    @categories = Category.all.order('created_at desc')
  end

  def topics_params
    params.require(:topic).permit(:title, :body, :category_id)
  end

end
