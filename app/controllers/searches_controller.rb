class SearchesController < ApplicationController
  def index
  end  

  def new
    @search = Search.new
    @categories = Category.all
  end

  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  def show
    search = Search.find(params[:id])
    @results = search.search_words(current_user).paginate(page: params[:page]).per_page(5)
  end

  def search_params
    params.require(:search).permit(:keywords, :category, :learn, :popularity)
  end
end
