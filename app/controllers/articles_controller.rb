class ArticlesController < ApplicationController
  #authtentication method
  # http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  #if not logged in method
  before_action :logged_in?

  #index action for all articles to be available
  def index
    @articles = Article.all
  end

  #show action to pass a article id as parameter to route url
  def show
    @article = Article.find(params[:id])
  end

  #new article action
  def new
    @article = Article.new
  end

  #create article action
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  #edit article
  def edit
   @article = Article.find(params[:id])
  end

   #update article
   def update
     @article = Article.find(params[:id])

     if @article.update(article_params)
       redirect_to @article
     else
       render :edit
     end
   end

   #Delete destroy article

   def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path #e can also redirect to articles_path
  end

  #securing it somehow

  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end

end
