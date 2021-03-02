class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @movies = Movie.all
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end
  
  def find_similar
    @title = Movie.find params[:id]
    @movie = Movie.find_movies_same_director(params[:id])
    #Case 1:Movie has no similar movie?
    unless @movie.nil?
#       #return view with list of directors. Note: Can also be empty
#       puts "Not nil!"
#       @movie.find_each do |mov|
#         puts mov.director
#       end
      @movie
    #Case 2:Movie has no director
    else
#       puts "Nil!"
#       puts @movie
      flash[:notice] = "'#{@title.title}' has no director info."
      redirect_to movies_path
    end
  end

  private
  # Making "internal" methods private is not required, but is a common practice.
  # This helps make clear which methods respond to requests, and which ones do not.
  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date, :director)
  end
end
