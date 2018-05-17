class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :'artists/index'
  end

  get '/artists/new' do #form params[:song] {title: whatever, artist: id}
    erb :'artists/new'
  end

  post '/artists' do
    @artist = Artist.create(params[:artist])
    redirect "/artists/#{@artist.slug}"
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'artists/show'
  end
end
