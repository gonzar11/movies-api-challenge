module Api
  class PeopleController < ApplicationController
    before_action :set_person, only: [:show, :update, :destroy]
    skip_before_action :authorize_request, only: [:index, :show]
  
    def index
      @people = Person.all
      json_response(@people)
    end
  
    def create
      @person = Person.new(person_params)
      assign_movies_to_person    
      @person.save!
      json_response(@person, :created)
    end
  
    def show
      json_response(@person)
    end
  
    def update
      #I need to put it inside a transaction because collection_ids= will fire update
      #RecordNotFound when any ids are not valid. I need to leave the db in a consistent state.
      Person.transaction do
        @person.update!(person_params)
        assign_movies_to_person
      end
      json_response(@person)
    end
  
    def destroy
      @person.destroy
      head :no_content
    end
  
    private
  
    def person_params
      params.permit(:first_name, :last_name, :aliases)
    end
  
    def set_person
      @person = Person.find(params[:id])
    end
  
    def assign_movies_to_person
      @person.acted_movie_ids = params[:acted_movies] if params[:acted_movies]
      @person.directed_movie_ids = params[:directed_movies] if params[:directed_movies]
      @person.produced_movie_ids = params[:produced_movies] if params[:produced_movies]
    end
  end
end
