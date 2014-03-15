class PostsController < ApplicationController
  before_filter :authenticate_photographer!, only: [:new, :create, :edit, :update, :destroy]

	def new
    @post = Post.new
	end

	def create
    @post = current_photographer.posts.new(post_params)

    if @post.save
      flash[:notice] = "Post Created"
      redirect_to @post
    else
    	@errors = @post.errors.messages
      render "new"
    end
	end
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end

  def index 
    @posts = Post.all.order("created_at DESC")
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)

    if @post.save
    	flash[:notice] = "Post Updated"
    	redirect_to @post
    else
    	@errors = @post.errors.messages
    	render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete
    flash[:notice] = "'#{@post.title}' has been removed."
    redirect_to posts_path
  end

	private

	def post_params
    params.require(:post).permit(:title, :description, :body)
	end
end
