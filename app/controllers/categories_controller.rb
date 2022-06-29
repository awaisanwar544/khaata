class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories
  end

  def new
    @category = current_user.categories.build
  end

  def create
    @category = current_user.recipes.build(recipe_params)

    if @recipe.save
      redirect_to recipe_path(@recipe), notice: 'Recipe Created'
    else
      @errors = @recipe.errors.full_messages
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
