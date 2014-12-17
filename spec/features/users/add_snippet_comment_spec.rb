include Warden::Test::Helpers
Warden.test_mode!

feature 'Add snippet comment' do

  after(:each) do
    Warden.test_reset!
  end

  scenario 'add comment with valid user' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    

    snippet = Snippet.create :filename => 'testsnippet.rb',
	    												:content => 'test snippet',
	    												:output => ''
		visit snippets_path
    find("#snippet_show_#{snippet.id}").click_link 'Show'
    current_path.should == snippet_path(@snippet)      

    expect(page).to have_content 'Snippet details'

    fill_in 'New comment', :with => 'Is this working?'

    click_button 'Add comment'

    expect(page).to have_content 'Your comment has successfully been added.'
    expect(page).to have_content 'Is this working?'

    current_path.should == snippet_path(@snippet)    
    
  end

  
end
