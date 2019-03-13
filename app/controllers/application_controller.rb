
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    rediect "/articles"
  end

#create  = get + post 
  get '/articles/new' do 
    erb :new
  end 

  post '/articles' do
    # binding.pry
    @new_article = Article.create(params) #create an object in database
    redirect "/articles/#{@new_article.id}"
  end 

#Index
  get '/articles' do
    @articles = Article.all
    erb :index
  end 

  #show 
  get '/articles/:id' do
      @article = Article.find(params[:id])
      erb :show
  end 

  #update  = get + patch 

  get '/articles/:id/edit' do
    #find the book try to edit 
    @article = Article.find(
    params[:id]
    )
    erb :edit
  end 

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect "/articles/#{@article.id}"
  end 

  #delete  => delete on the form show page
  delete '/articles/:id' do 
    # @article = Article.find(
    # params[:id])
    # @article.destroy(params[:article])
    Article.destroy(
    params[:id]
    )
    redirect "/articles"
  end 

end
