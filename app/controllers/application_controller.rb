
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
    erb :index
  end

  # #show specific article id
  # get '/articles/:id' do
  #   erb :show
  # end

  # #edit page for article to edit
  # get '/articles/:id/edit' do
  #   erb :edit
  # end

  # #patch edits
  # patch '/articles/:id' do
  #   erb :show
  # end

  # #delete article
  # post '/articles/:id/delete' do
  #   erb :delete
  # end
end
