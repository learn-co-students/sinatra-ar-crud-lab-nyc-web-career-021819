
require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id' do
    @article = Article.all.find(params["id"].to_i)
    erb :show
  end

  post '/articles/' do
    @article = Article.create(params)
    redirect "/articles/#{@article.id}"
  end

  get '/articles' do
    erb :index
  end

  get '/articles/:id/edit' do
    @article = Article.all.find(params["id"].to_i)
    erb :edit
  end

  patch '/articles/:id' do
    article = Article.all.find(params["id"].to_i)
    article.update(title: params["title"], content: params["content"])
    redirect "/articles/#{article.id}"
  end

  delete '/articles/:id/delete' do
    article = Article.all.find(params["id"].to_i)
    Article.delete(article.id)
    redirect "/articles"
  end
end
