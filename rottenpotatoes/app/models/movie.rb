class Movie < ActiveRecord::Base
  
  def self.find_movies_same_director(movie_id)
    #Find movies with same directors
    director = Movie.find_by(:id => movie_id).director
#     puts "Director is: "
#     puts director
    unless director.nil? or director == ""
      list = Movie.where(:director => director)
#       list = Movie.all
#       list.each do |mov|
#         puts mov.title
#         puts mov.director
#       end
      return(list) #Do search
    # if ratings_list is nil, retrieve ALL movies    
    else
#       @ratings_to_show = []
      return nil
    end
  end
end
