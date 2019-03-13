
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/articles"
  end

  #index
  get '/articles' do
    erb :index
  end

  #new
  get '/articles/new' do
    erb :new
  end

  #create
  post '/articles' do
      @new_article = Article.create(params)
      redirect to "/articles/#{@new_article.id}"
  end

  #show

  get '/articles/:id' do
   @new_article = Article.find(params[:id])
   erb :show
  end

  #edit
  get '/articles/:id/edit' do
    @new_article = Article.find(params[:id])
    erb :edit
  end

  #update
  patch "/articles/:id" do
    @new_article = Article.find(params[:id])
    @new_article.update(title: params[:title], content: params[:content])
    redirect to "/articles/#{@new_article.id}"
  end

  #delete
  delete "/articles/:id" do
    #model
    Article.destroy(params[:id])

    #response
    redirect to "/articles"

  end


end
