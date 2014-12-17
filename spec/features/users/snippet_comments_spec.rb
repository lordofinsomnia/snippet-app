include Warden::Test::Helpers
Warden.test_mode!

feature 'Add snippet comment' do

  after(:each) do
    Warden.test_reset!
  end

  scenario 'add comment with valid user' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    @snippet = FactoryGirl.create(:snippet)

    visit root_path
    click_link 'Snippets count'    
    current_path.should == snippets_path
		expect(page).to have_content 'All snippets'
		
    find("#snippet_show_#{@snippet.id}").click_link 'Show'
    

    expect(page).to have_content 'Snippet details'
    current_path.should == snippet_path(@snippet)

    fill_in 'New comment', :with => 'Is this working?'

    click_button 'Add comment'

    expect(page).to have_content 'Your comment has successfully been added.'
    expect(page).to have_content 'Is this working?'

    current_path.should == snippet_path(@snippet)    
    
  end

  
end
