class RecipesController < ApplicationController


    skip_before_action(:check_login, only: [:index, :show, :category])
    def index
        @recipes = Recipe.all
        @categories = []
        @recipes.each do |r|
            @categories.push(r.category)
        end
        
        @categories = @categories.uniq
    end

    def new 
        @ingredients = Ingredient.all
        @recipes = Recipe.all
        @recipe = Recipe.new
        @categories = Recipe.all.map {|recipe| recipe.category}
    end

    def create
        # byebug
        @recipe = Recipe.create({
            name: params[:recipe][:name],
            category: params[:recipe][:category],
            description: params[:recipe][:description],
            recipe_url: params[:recipe][:recipe_url],
            ingredient_ids: params[:recipe][:ingredient_ids],
            user_id: session[:user_id]
            })
         
            redirect_to("/users/#{session[:user_id]}")
    end

    def show
        @recipe = Recipe.find(params[:id])
        cal = @recipe.ingredients.map do |ing| 
            ing.calories
        end
        @cal_total = cal.reduce(0, :+)
        @reviews = @recipe.reviews
            
    end

    def edit
        @recipe = Recipe.find(params[:id])
    end

    def update

        @recipe = Recipe.find(params[:id])
        @recipe.update({
            name: params[:recipe][:name],
            category: params[:recipe][:category],
            description: params[:recipe][:description],
            recipe_url: params[:recipe][:recipe_url],
            user_id: session[:user_id]
        })
        redirect_to "/recipes/#{@recipe.id}"
    end

    def destroy
        @recipe = Recipe.find(params[:id])
        @recipe.destroy
        redirect_to "/users/#{session[:user_id]}"
    end

    def category
        
        @recipes = Recipe.all
        @specific_category = @recipes.select do |r|
            r.category == params[:category]
        end
        @category = params[:category]
    end

        

     


end