class PostsController < ApplicationController
  before_filter :authenticate_photographer!, only: [:new, :create, :edit, :update, :destroy]

	def new
    @post = Post.new
    @tags = Tag.all.order(:name)
	end

	def create
    @post = current_photographer.posts.new(post_params)
    
    params[:tags].each do |tag_name, value|
      if value == "1"
        @tag = Tag.find_by(name: tag_name)
        @post.tags << @tag
      end
    end

    if @post.save
      flash[:notice] = "Post Created"
      redirect_to @post
    else
      @tags = Tag.all.order(:name)
    	@errors = @post.errors.messages
      render "new"
    end
	end
  
  def show
    @post = Post.find(params[:id])
    Visit.track(@post, request.remote_ip)
    @comment = Comment.new
    @comments = @post.comments
  end

  def index 
    @posts= Post.paginate(:page => params[:page], :per_page => 3).order("created_at DESC")
    @tags = Tag.all
    @recent_posts = Post.all.order("created_at DESC").limit(5)
    @popular_posts = Post.joins(:visit).order('total_visits DESC').limit(5)
  end

  def edit
    @post = Post.find(params[:id])
    @tags = Tag.all
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    @post.tags.clear
    
    params[:tags].each do |tag_name, value|
      if value == "1"
        @tag = Tag.find_by(name: tag_name)
        @post.tags << @tag
      end
    end

    if @post.save
    	flash[:notice] = "Post Updated"
    	redirect_to @post
    else
    	@errors = @post.errors.messages
    	render "edit"
    end
  end

  def search
    flash[:warning] = "this feature is not ready"
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete
    flash[:notice] = "'#{@post.title}' has been removed."
    redirect_to posts_path
  end

	private

	def post_params
    params.require(:post).permit(:title, :description, :body, :cover_image)
	end
end
