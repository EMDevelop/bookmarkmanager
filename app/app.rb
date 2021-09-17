require 'sinatra/base'
require 'sinatra/reloader'
require_relative '../lib/bookmark'

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override

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
    p params
    Bookmark.add(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/update/:id' do
    # @bookmark = params[:id]
    @bookmark = Bookmark.one_bookmark(id: params[:id])
    erb :update
  end

  put '/bookmarks/:id' do
    Bookmark.update(id: params[:id],url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end