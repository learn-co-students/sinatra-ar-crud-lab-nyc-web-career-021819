
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #landing page
  get '/' do
    erb :index
  end

  #who all articles
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  #create article page
  get '/articles/new' do
    erb :new
  end

  #post new article to arcticles
  post '/articles' do
    @article = Article.create(title: params[:title], content: params[:content])
    @articles = Article.all
    
    erb :show
    redirect "/articles/#{@article.id}"
  end

  # #show specific article id
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  #edit page for article to edit
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  #patch edits
  patch '/articles/:id' do
    # @original_article = Article.find(params[:id])
    @article = Article.update(params[:id], title: params[:title], content: params[:content])
    erb :show
  end

  # #view delete page
  # get '/articles/:id/delete' do
  #   @article = Article.find(params[:id])
  #   erb :show
  # end

  # delete article
  delete '/articles/:id/delete' do
    Article.delete(params[:id])
    erb :index
  end
end
