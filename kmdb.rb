# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
Actor.destroy_all
Role.destroy_all
Movie.destroy_all
Studio.destroy_all

# Generate models and tables, according to the domain model.
# TODO!


# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

#Adding Movies to the database

Batman_Begins = Movie.new
Batman_Begins["title"] = "Batman Begins"
Batman_Begins["year_released"] = 2005
Batman_Begins["rated"] = "PG-13"
Batman_Begins["studio_id"] = 1

Batman_Begins.save

The_Dark_Knight = Movie.new
The_Dark_Knight["title"] = "The Dark Knight"
The_Dark_Knight["year_released"] = 2008
The_Dark_Knight["rated"] = "PG-13"
The_Dark_Knight["studio_id"] = 1

The_Dark_Knight.save

The_Dark_Knight_Rises = Movie.new
The_Dark_Knight_Rises["title"] = "The Dark Knight Rises"
The_Dark_Knight_Rises["year_released"] = 2012
The_Dark_Knight_Rises["rated"] = "PG-13"
The_Dark_Knight_Rises["studio_id"] = 1

The_Dark_Knight_Rises.save

puts "There are #{Movie.all.count} movies."

#Adding actors to the database
new_actor = Actor.new
new_actor["name"] = "Christian Bale"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Michael Caine"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Liam Nelson"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Katie Holmes"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Gary Oldman"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Heath Ledger"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Aaron Eckhart"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Maggie Gyllenhaal"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Tom Hardy"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Joseph Gordon-Levitt"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Anne Hathaway"
new_actor.save

puts "There are #{Actor.all.count} actors."

# Adding studios to the database
new_studio = Studio.new
new_studio["name"] = "Warner Bros."
new_studio.save

# Adding character names to the database 
#finding rows of the 3 movies to find the ids in the Movie table

movie1 = Movie.find_by({"title" => "Batman Begins"})
movie2 = Movie.find_by({"title" => "The Dark Knight"})
movie3 = Movie.find_by({"title" => "The Dark Knight Rises"})

#finding rows of the actors to find the ids in the Actor table
Actor1 = Actor.find_by({"name" => "Christian Bale"})
Actor2 = Actor.find_by({"name" => "Michael Caine"})
Actor3 = Actor.find_by({"name" => "Liam Nelson"})
Actor4 = Actor.find_by({"name" => "Katie Holmes"})
Actor5 = Actor.find_by({"name" => "Gary Oldman"})
Actor6 = Actor.find_by({"name" => "Heath Ledger"})
Actor7 = Actor.find_by({"name" => "Aaron Eckhart"})
Actor8 = Actor.find_by({"name" => "Maggie Gyllenhaal"})
Actor9 = Actor.find_by({"name" => "Tom Hardy"})
Actor10 = Actor.find_by({"name" => "Joseph Gordon-Levitt"})
Actor11 = Actor.find_by({"name" => "Anne Hathaway"})

# Adding Batman begin chracters
new_role = Role.new
new_role["movie_id"] = movie1["id"]
new_role["actor_id"] = Actor1["id"]
new_role["character_name"] = "Bruce Wayne"
new_role.save

new_role = Role.new
new_role["movie_id"] = movie1["id"]
new_role["actor_id"] = Actor2["id"]
new_role["character_name"] = "Alfred"
new_role.save

new_role = Role.new
new_role["movie_id"] = movie1["id"]
new_role["actor_id"] = Actor3["id"]
new_role["character_name"] = "Ra's Al Ghul"
new_role.save

new_role = Role.new
new_role["movie_id"] = movie1["id"]
new_role["actor_id"] = Actor4["id"]
new_role["character_name"] = "Rachel Dawes"
new_role.save

new_role = Role.new
new_role["movie_id"] = movie1["id"]
new_role["actor_id"] = Actor5["id"]
new_role["character_name"] = "Commissioner Gordon"
new_role.save

# Adding The dark Knight chracters
new_role = Role.new
new_role["movie_id"] = movie2["id"]
new_role["actor_id"] = Actor1["id"]
new_role["character_name"] = "Bruce Wayne"
new_role.save

new_role = Role.new
new_role["movie_id"] = movie2["id"]
new_role["actor_id"] = Actor6["id"]
new_role["character_name"] = "Joker"
new_role.save

new_role = Role.new
new_role["movie_id"] = movie2["id"]
new_role["actor_id"] = Actor7["id"]
new_role["character_name"] = "Harvey Dent"
new_role.save

new_role = Role.new
new_role["movie_id"] = movie2["id"]
new_role["actor_id"] = Actor2["id"]
new_role["character_name"] = "Alfred"
new_role.save

new_role = Role.new
new_role["movie_id"] = movie2["id"]
new_role["actor_id"] = Actor8["id"]
new_role["character_name"] = "Rachel Dawes"
new_role.save

# Adding The dark Knight Rises characters
new_role = Role.new
new_role["movie_id"] = movie3["id"]
new_role["actor_id"] = Actor1["id"]
new_role["character_name"] = "Bruce Wayne"
new_role.save

new_role = Role.new
new_role["movie_id"] = movie3["id"]
new_role["actor_id"] = Actor5["id"]
new_role["character_name"] = "Commissioner Gordon"
new_role.save

new_role = Role.new
new_role["movie_id"] = movie3["id"]
new_role["actor_id"] = Actor9["id"]
new_role["character_name"] = "Bane"
new_role.save

new_role = Role.new
new_role["movie_id"] = movie3["id"]
new_role["actor_id"] = Actor10["id"]
new_role["character_name"] = "John Blake"
new_role.save

new_role = Role.new
new_role["movie_id"] = movie3["id"]
new_role["actor_id"] = Actor11["id"]
new_role["character_name"] = "Selina Kyle"
new_role.save

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

for movie in Movie.all
    title = movie["title"]
    year_released = movie["year_released"]
    rated = movie["rated"]
    studio = movie["studio_id"]
    puts "#{title} #{year_released} #{rated} #{studio}"
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

for role in Role.all
   # find the movie_id for each row in the role table
    movie_name = role["movie_id"]
   # Once you find the id, find that id in the movie table and extract title column from that row 
    actual_movie_name = Movie.find_by({"id" => movie_name})["title"]

  # find the role id for each row in the role table
    actor_name = role["actor_id"]
  # Once you find the id, find that id in the actor table and extract name column from that row 
   actual_actor_name = Actor.find_by({"id" => actor_name})["name"]

    character_name = role["character_name"]
   
    puts "#{actual_movie_name} #{actual_actor_name} #{character_name}"
end
