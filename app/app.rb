require 'sinatra/base'
require 'sinatra/reloader'
require_relative '../lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :index
  end

  get '/add' do
    erb :add
  end

  post '/add' do
    Bookmark.add(params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end