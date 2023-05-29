class MoviesController < ApplicationController
  def index
    @movies = Movie.all

    respond_to do |format|
      format.html # Render the default HTML template
      format.json { render json: @movies } # Render JSON response
      format.xml { render xml: @movies } # Render XML response
    end
  end

  def new
    @list = List.find(params[:list_id])
    @movie = Movie.new
  end

  def create
    @list = List.find(params[:list_id])
    @movie = @list.movies.build(movie_params)
    if @movie.save
      redirect_to @list, notice: 'Movie was successfully added.'
    else
      render :new
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to @movie.list, notice: 'Movie was successfully removed.'
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description)
  end
end
