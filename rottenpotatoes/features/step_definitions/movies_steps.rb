
Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create movie
  end
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.index(e1) < page.body.index(e2))
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(', ').each do |rating|
    step %{I #{uncheck.nil? ? '' : 'un'}check "ratings_#{rating}"}
  end
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  Movie.all.each do |movie|
    step %{I should see "#{movie.title}"}
  end
end

Then(/^the director of "([^"]*)" should be "([^"]*)"$/) do |movie, director|
#   pending # Write code here that turns the phrase above into concrete actions
  search_dir = Movie.find_by(:title => movie).director
  expect(search_dir).to eq(director)
end

Then(/^the director field of "([^"]*)" should be blank$/) do |movie|
#   pending # Write code here that turns the phrase above into concrete actions
  search_dir = Movie.find_by(:title => movie)
  expect(search_dir.director).to eq("")
end