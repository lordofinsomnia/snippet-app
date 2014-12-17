include Warden::Test::Helpers
Warden.test_mode!

feature 'Snippets' do

  after(:each) do
    Warden.test_reset!
  end

  scenario "could not creates a new snippet with visitor" do     
    go_to_all_snippets

    expect(page).to have_no_content 'Create Snippet'      
  end  
  
  scenario "creates a new snippet with user" do     
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    go_to_all_snippets    
    @snippet = FactoryGirl.create(:snippet)

    fill_in 'Filename', :with => @snippet.filename
    fill_in 'Content', :with => @snippet.content
    click_button 'Create Snippet'
    
    expect(page).to have_content 'Snippet details'    
    
    #expect(page).to have_content @snippet.filename
    #expect(page).to have_content @snippet.content

    expect(page).to have_content 'Your snippet has successfully been added.'    
  end

=begin
  scenario "edits a snippet with user" do 
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    go_to_all_snippets       
    visit snippets_path

    @snippet = FactoryGirl.create :snippet    
    #edit_snippet_path(@snippet)
   
    click_link 'Edit'

    current_path.should == edit_snippet_path(@snippet)

    find_field('Filename').value.should == 'testsnippet.rb'
    find_field('Content').value.should == 'test snippet'

    fill_in 'Filename', :with => 'testsnippet1.rb'
    fill_in 'Content', :with => 'update snippet'

    click_button 'Update Snippet'

    current_path.should == snippet_path(@snippet)

    page.should have_content 'testsnippet1.rb'
    page.should have_content 'update snippet'     
    page.should have_content 'Your snippet has successfully been updated.'
  end
=end
  
end

