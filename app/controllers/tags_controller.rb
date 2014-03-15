class TagsController < ApplicationController
  before_filter :authenticate_photographer!

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      flash[:notice] = "Tag created"
      redirect_to tags_path
    else
    	@errors = @tag.errors.messages
      render 'new'
    end
  end

  def index
    @tags = Tag.all.order(:name)
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.delete
    flash[:notice] = "#{@tag.name} removed."
    redirect_to tags_path
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    @tag.update(tag_params)

    if @tag.save
      flash[:notice] = "Tag '#{@tag.name}' updated"
      redirect_to tags_path
    else
      @errors = @tag.errors.messages
      render 'edit'
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
