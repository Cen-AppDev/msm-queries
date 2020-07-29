require "rails_helper"

describe "/movies" do
  it "lists the titles of each Movie record in the database", points: 1 do
    
    director = Director.new
    director.name = "Travis McElroy"
    director.dob = 38.years.ago
    director.image = ""
    director.save

    the_turgle = Movie.new
    the_turgle.title = "The Turgle"
    the_turgle.description = "Matt Damon, being Matt Damon."
    the_turgle.year = 2008
    the_turgle.duration = 90
    the_turgle.director_id = director.id
    the_turgle.save

    hello_world = Movie.new
    hello_world.title = "Hello, World"
    hello_world.description = "Program's first world."
    hello_world.year = 2001
    hello_world.duration = 95
    hello_world.director_id = director.id
    hello_world.save
    
    visit "/movies"

    expect(page).to have_text(the_turgle.title),
      "Expected page to have the title, 'The Turgle'"
    
    expect(page).to have_text(hello_world.title),
      "Expected page to have the title, '#{hello_world.title}'"
  end
end

describe "/movies" do
  it "displays the name of the Director who directed the Movie", points: 1 do
    
    director = Director.new
    director.name = "Matthew Mercer"
    director.dob = 36.years.ago
    director.image = ""
    director.save

    other_director = Director.new
    other_director.name = "Trina Kayetti"
    other_director.dob = 30.years.ago
    other_director.image = ""
    other_director.save

    the_turgle = Movie.new
    the_turgle.title = "The Turgle"
    the_turgle.description = "Matt Damon, being Matt Damon."
    the_turgle.year = 2008
    the_turgle.duration = 90
    the_turgle.director_id = director.id
    the_turgle.save

    hello_world = Movie.new
    hello_world.title = "Hello, World"
    hello_world.description = "Program's first world."
    hello_world.year = 2001
    hello_world.duration = 95
    hello_world.director_id = other_director.id
    hello_world.save

    visit "/movies"
    
    expect(page).to have_text(director.name),
      "Expected page to have the name, '#{director.name}'"
    
    expect(page).to have_text(other_director.name),
      "Expected page to have the name, '#{other_director.name}'"
  end
end

describe "/movies" do
  it "has a 'Show details' link to the details page of each Movie", points: 1 do
    
    director = Director.new
    director.name = "Matthew Mercer"
    director.dob = 36.years.ago
    director.image = ""
    director.save

    other_director = Director.new
    other_director.name = "Trina Kayetti"
    other_director.dob = 30.years.ago
    other_director.image = ""
    other_director.save

    the_turgle = Movie.new
    the_turgle.title = "The Turgle"
    the_turgle.description = "Matt Damon, being Matt Damon."
    the_turgle.year = 2008
    the_turgle.duration = 90
    the_turgle.director_id = director.id
    the_turgle.save

    hello_world = Movie.new
    hello_world.title = "Hello, World"
    hello_world.description = "Program's first world."
    hello_world.year = 2001
    hello_world.duration = 95
    hello_world.director_id = other_director.id
    hello_world.save

    visit "/movies"

    expect(page).to have_tag("a", :with => { :href => "/movies/#{the_turgle.id}" }, :text => /Show details/i),
      "Expected page to have the a link with the text 'Show details' and an href of '/movies/#{the_turgle.id}'"

    expect(page).to have_tag("a", :with => { :href => "/movies/#{hello_world.id}" }, :text => /Show details/i),
      "Expected page to have the a link with the text 'Show details' and an href of '/movies/#{hello_world.id}'"

  end
end
