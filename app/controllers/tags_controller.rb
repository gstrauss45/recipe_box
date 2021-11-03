class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.create(tag_params)
    @tag.save
    redirect_to @tag
  end

  def show
    @tag = Tag.find(params[:id])
    @array = Recipe.all.map { |div| [div.name, div.id] }
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to @tag
    else
      render :edit
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to root_path
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def add_recipe
    @tag = Tag.find(params[:tag_id])
    @tag.recipes.append(Recipe.find(params[:recipe_id]))
    @tag.save
    redirect_to @tag
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end
end
