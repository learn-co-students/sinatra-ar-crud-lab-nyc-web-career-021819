
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
    erb :index
  end

  #create article page
  get '/articles/new' do
    erb :new
  end

  #post new article to arcticles
  post '/articles' do
  end

  #show specific article id
  get '/articles/:id' do
  end

  #edit page for article to edit
  get '/articles/:id/edit' do
  end

  #patch edits
  patch '/articles/:id' do
  end

  #delete article
  post '/articles/:id/delete' do
  end
end
