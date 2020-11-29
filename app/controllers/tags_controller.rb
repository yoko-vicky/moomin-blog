class TagsController < ApplicationController
  before_action :set_tag, only: %i[show destroy]

  def index
    @tags = Tag.all
  end

  def show
    @articles = @tag.articles
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = "Successfully Tag #{@tag.name} is created..."
      redirect_to tag_path(@tag)
    else
      render 'new'
    end
  end

  def destroy
    @tag.destroy
    flash[:notice] = "Successfully #{@tag.name} is deleted..."
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
