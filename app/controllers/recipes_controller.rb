class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.order('rating DESC')
    if params[:searched_recipes]
      @searched_recipes = params[:searched_recipes]
    end
  end

  def new

    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    @recipe.save
    redirect_to @recipe
  end

  def show
    @recipe = Recipe.find(params[:id])
    @array = Tag.all.map { |div| [div.name, div.id] }
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def add_tag
    @recipe = Recipe.find(params[:recipe_id])
    @recipe.tags.append(Tag.find(params[:tag_id]))
    @recipe.save
    redirect_to @recipe
  end

  def remove_tag
    @recipe = Recipe.find(params[:id])
    @tag = Tag.find(params[:p_id])
    @recipe.tags.delete(@tag)
    @tag.recipes.delete(@recipe)
    redirect_to @recipe
  end

  def search
    @recipes = Recipe.all.order('rating DESC')
    @searched_recipes = Recipe.all.map  { |div| if div.ingrediants.include? params[:search]
                                        div
                                      end
                              }
    render :index
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :ingrediants, :instructions, :rating)
  end
end
