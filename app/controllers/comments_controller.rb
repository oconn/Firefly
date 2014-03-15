class CommentsController < ApplicationController
  before_filter :authenticate_photographer!, only: [:block_user]
  before_filter :check_if_blocked, only: [:create]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    
    if @comment.nickname != ""
      @comment.name = nil; @comment.body = nil
      flash[:notice] = "Leave the nickname field blank"
    end

    if @comment.save
      @comment.update(ip_address: request.remote_ip)
      redirect_to @post 
    else
      @errors = @comment.errors.messages
      render template: "posts/show"
    end
  end

  def block_user
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    
    case params[:block_user][:block_user]
    when "1"
      flash[:notice] = "Comment Removed" 
    when "2"
      BlacklistIp.create(ip_address: @comment.ip_address)
      flash[:notice] = "Comment Removed & User Blocked"
    end
    
    @comment.delete
    redirect_to @post
  end

  private

  def comment_params 
    params.require(:comment).permit(:name, :body, :nickname)
  end

  def check_if_blocked
    redirect_to root_path if !BlacklistIp.where(ip_address: request.remote_ip).empty?
  end
end
