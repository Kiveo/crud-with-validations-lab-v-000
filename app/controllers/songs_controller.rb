class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params(:title, :released, :release_year, :artist_name, :genre))
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def show
    get_song
  end

  def edit
    get_song
  end

  def update #patch?
    get_song
    if @song.update(song_params)
      redirect_to song_path
    else
      render :edit
    end
  end

  def delete
  end

  private

  def get_song
    @song = Song.find(params[:id])
  end

  def song_params(*args)
    params.require(:song).permit(*args)
  end

end
