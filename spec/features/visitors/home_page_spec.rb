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


	scenario 'see all users we have' do
    visit root_path
    click_link 'Users count'
    current_path.should == new_user_session_path
		expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end  

  scenario 'see how many snippets we have' do
    visit root_path
    click_link 'Snippets count'    
    current_path.should == snippets_path
		expect(page).to have_content 'All snippets'
  end


end
