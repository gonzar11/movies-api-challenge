class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :update, :destroy]

  def index
    @movies = Movie.all
    json_response(@movies)
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.casting_ids = params[:casting_ids] if params[:casting_ids]
    @movie.director_ids = params[:director_ids] if params[:director_ids]
    @movie.producer_ids = params[:producer_ids] if params[:producer_ids]
    @movie.save!

    json_response(@movie, :created)
  end

  def show
    json_response(@movie)
  end

  def update
    #I need to put it inside a transaction because collection_ids= will fire update
    #RecordNotFound when any ids are not valid. I need to leave db in a cosnsistent state.
    Movie.transaction do
      @movie.update!(movie_params)
      @movie.casting_ids = params[:casting_ids] if params[:casting_ids]
      @movie.director_ids = params[:director_ids] if params[:director_ids]
      @movie.producer_ids = params[:producer_ids] if params[:producer_ids]
      @movie.save!  
    end
    
    json_response(@movie)
  end

  def destroy
    @movie.destroy
    head :no_content
  end

  private

  def movie_params
    params.permit(:title, :release_year)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
