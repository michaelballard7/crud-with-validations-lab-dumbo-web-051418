class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = find_song

    render :show
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = find_song

    render :edit
  end

  def update
    @song = find_song
    if @song.update(song_params)
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy

    @song = find_song
    @song.destroy

    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name, :genre, :released,:release_year)
  end

  def find_song
    @song = Song.find(params[:id])
  end
end
