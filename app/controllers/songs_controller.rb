class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do #form params[:song] {title: whatever, artist: id}
    @artists = Artist.all
    @genres = Genre.all

    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.new(params[:song])
    if params[:artist][:id]
      @song.artist = Artist.find(params[:artist][:id])
    elsif params[:artist][:name]
      @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    end
    @song.save

    if params[:genre_ids]
      params[:genre_ids].each do |genre_id|
        @song.genres << Genre.find(genre_id)
      end
    elsif params[:genre][:name]
      @song.genres << Genre.find_or_create_by(name: params[:genre][:name])
    end
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @artists = Artist.all
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end


  get '/songs/:slug/edit' do
    @artists = Artist.all
    @genres = Genre.all
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    if params[:artist][:id]
      @song.artist = Artist.find(params[:artist][:id])
    elsif params[:artist][:name]
      @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    end
    @song.save

    if params[:genre_ids]
      params[:genre_ids].each do |genre_id|
        @song.genres << Genre.find(genre_id)
      end
    elsif params[:genre][:name]
      @song.genres << Genre.find_or_create_by(name: params[:genre][:name])
    end
    flash[:message2] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

end
