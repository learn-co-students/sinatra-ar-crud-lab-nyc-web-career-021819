require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

#index
  get '/articles' do
    @articles = Article.all
    erb :index
  end

#new
  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    # binding.pry
    @article = Article.create(:title => params[:title], :content=> params[:content])
    redirect to "/articles/#{@article.id}"
  end

#show

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end


  # edit

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

#patch

  patch 'articles/:id' do
    @article = Article.find(params[:id])
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save
    redirect to "/articles/#{@article.id}"
  end

  #delete

  delete 'articles/:id/delete' do
    @articles = Article.find(params[:id])
    @articles.delete
    redirect to '/articles'
  end

end
