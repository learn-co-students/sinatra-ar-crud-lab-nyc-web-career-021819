
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

####################################################
#new
  get '/articles/new' do
    erb :new
  end

#create
  post '/articles' do
    @article = Article.create(title: params[:title], content: params[:content])

    redirect "/articles/#{@article.id}"
  end

##########################################################

  get '/articles' do
    #model
    @articles = Article.all
    #response
    erb :index
  end

  get '/articles/:id' do
    #model
    @article = Article.find(params[:id])
    #response
    erb :show
  end

#######################################################################

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    #binding.pry
    @article = Article.find(params[:id])
    @article.update(title: params[:title], content: params[:content])
    redirect "/articles/#{@article.id}"
  end

########################################################################
#delete
  delete '/articles/:id/delete' do
    @article = Article.find_by_id(params[:id])
    @article.delete
    redirect to '/articles'
  end

#######################################################################
end
