class SearchsController < ApplicationController
  before_action :reindex

  def show
    if params[:keyword].present?
      search = Article.search params[:keyword], fields: [:title, :content]
    end
    @search = { results: search.response, articles: search }
    json_response(@search)
  end

  private
    def reindex
      Article.reindex
    end

end
