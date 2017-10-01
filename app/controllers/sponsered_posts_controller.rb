class SponseredPostsController < ApplicationController
  def show
    @sponsered_post = SponseredPost.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @sponsered_post = SponseredPost.New
  end
  
  def create
    @sponsered_post = SponseredPost.new
    @sponsered_post.title = params[:sponsered_post][:title]
    @sponsered_post.body = params[:sponsered_post][:body]
    @sponsered_post.price = params[:sponsered_post][:price]
    @topic = Topic.find(params[:topic_id])
    @sponsered_post.topic = @topic
    
    if @sponsered_post.save
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @sponsered_post]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end

  end

  def edit
    
  end
end
