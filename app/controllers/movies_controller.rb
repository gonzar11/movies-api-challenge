class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :update, :destroy]
  skip_before_action :authorize_request, only: [:index, :show]

  def index
    @movies = Movie.all
    json_response(@movies)
  end

  def create
    @movie = Movie.new(movie_params)
    assign_person_roles_to_movie
    @movie.save!

    json_response(@movie, :created)
  end

  def show
    json_response(@movie)
  end

  def update
    #I need to put it inside a transaction because collection_ids= will fire update
    #RecordNotFound when any ids are not valid. I need to leave the db in a consistent state.
    Movie.transaction do
      @movie.update!(movie_params)
      assign_person_roles_to_movie
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

  def assign_person_roles_to_movie
    @movie.casting_ids = params[:casting] if params[:casting]
    @movie.director_ids = params[:directors] if params[:directors]
    @movie.producer_ids = params[:producers] if params[:producers]
  end
end
