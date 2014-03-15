class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    
    p params
    if @comment.nickname != ""
    	@comment.name = nil; @comment.body = nil
    	flash[:notice] = "Leave the nickname field blank"
    end

    if @comment.save
      @comment.update(ip_address: request.remote_ip)
      redirect_to @post 
    else
    	@errors = @comment.errors.messages
    	@errors[:body] = "Comment field cannot be blank."
    	render template: "posts/show"
    end
	end

	private

	def comment_params 
    params.require(:comment).permit(:name, :body, :nickname)
	end
end
