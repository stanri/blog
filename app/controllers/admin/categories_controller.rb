class Admin::CategoriesController < Admin::AdminController
    before_action :authenticate_user!
    before_action :set_category, only: [:edit, :update, :destroy ]

    def index 
        @categories = Category.all 
    end 

    def new 
        @category = Category.new 
    end 

    def create 
        @category = Category.new(category_params)
        if @category.save
            redirect_to admin_categories_path, success: 'Категорія успішно створенна'
        else
            flash[:danger] = 'Категорія не створенна'
            render :new 
        end 
    end 

    def edit
    end 

    def update
        if @category.update(category_params)
            redirect_to admin_categories_path, success: 'Категорія успішно оновленна'
        else 
            flash[:danger] = 'Категорія не оновленна'
            render :edit
        end 
    end 

    def destroy
        @category.destroy
        redirect_to categories_path, success: 'Категорія успішно видалена'
    end 

    private 

    def set_category
        @category = Category.find(params[:id])
    end 

    def category_params
        params.require(:category).permit(:name, :parent_id)
    end 
end 