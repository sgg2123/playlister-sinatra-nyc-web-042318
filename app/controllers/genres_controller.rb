class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'genres/index'
  end

  get '/genres/new' do #form params[:song] {title: whatever, genre: id}
    erb :'genres/new'
  end

  post '/genres' do
    @genre = Genre.create(params[:genre])
    redirect "/genres/#{@genre.slug}"
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'genres/show'
  end
end
