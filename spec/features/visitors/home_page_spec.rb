# Feature: Home page
#   As a visitor
#   I want to visit a home page
#   So I can learn more about the website
feature 'Home page' do

  # Scenario: Visit the home page
  #   Given I am a visitor
  #   When I visit the home page
  #   Then I see "Snippets"
  scenario 'visit the home page' do
    visit root_path
    expect(page).to have_content 'Snippets'
  end

  scenario 'see how many users we have' do
    visit root_path
    expect(page).to have_content 'Users count'
  end

=begin
	scenario 'see all users we have' do
    visit root_path
        
    #find("Users count").click_link 'Users count'
    click_button 'Users count'
    expect(page).to have_content 'All users'
  end  

  scenario 'see how many snippets we have' do
    visit root_path
    click_button 'Snippets count'
    expect(page).to have_content 'Snippets count'
  end
=end


end
