class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end
  
  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      redirect_to [@sub, @topic]
    else
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.udater(topic_params)
      redirect_to [@sub, @topic]
    else
      render :edit
    end
  end

  def destroy
    @Topic.find(params[:id]].destroy
    redirect_to sub_topics_path

  private
  def topic_params
    params.require(:topic).permit(:name, :body)
end
