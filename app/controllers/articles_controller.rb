class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
    json_response(@articles)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    json_response(@article)
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.create!(article_params)
    json_response(@article, :created)

    #@article = Article.new(article_params)
    #if @article.save
    #  render :show, status: :created, location: @article
    #else
    #  render json: @article.errors, status: :unprocessable_entity
    #end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    @article.update(article_params)
    head :no_content

    #if @article.update(article_params)
    #  render :show, status: :ok, location: @article
    #else
    #  render json: @article.errors, status: :unprocessable_entity
    #end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content)
    end
end
