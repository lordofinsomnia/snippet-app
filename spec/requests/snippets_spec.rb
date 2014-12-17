require 'rails_helper'

module ::RSpec::Core
  class ExampleGroup
    include Capybara::DSL
    include Capybara::RSpecMatchers
  end
end

RSpec.describe "Snippets", :type => :request do
	

  describe "GET /snippets" do
	  before do
			@snippet = Snippet.create :filename => 'testsnippet.rb',
	    													:content => 'test snippet',
	    													:output => ''
			visit snippets_path	    											
		end  
    it "display some snippets" do         	
    	page.should have_content 'testsnippet.rb'
    	page.should have_content 'test snippet'      
    end    
  	
  	it "edits a snippet" do  		
  		find("#snippet_edit_#{@snippet.id}").click_link 'Edit'

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
  	
  	it "should not update an empty snippet" do  		
  		find("#snippet_edit_#{@snippet.id}").click_link 'Edit'

  		find_field('Filename').value.should == 'testsnippet.rb'
    	find_field('Content').value.should == 'test snippet'

    	fill_in 'Filename', :with => ''
    	fill_in 'Content', :with => ''

    	click_button 'Update Snippet'

  		find_field('Filename').value.should == 'testsnippet.rb'
    	find_field('Content').value.should == 'test snippet'    	

			current_path.should == edit_snippet_path(@snippet)
			page.should have_content 'There was an error updating your snippet.'
  	end  

		it "should delete a snippet" do  		
  		find("#snippet_delete_#{@snippet.id}").click_link 'Delete'
  		page.should have_content 'Your snippet has successfully been deleted.'

  		page.should have_no_content 'testsnippet.rb'
  		page.should have_no_content 'test snippet'  		
  	end

    it "should be able to upload a snippet" do
      testsnippet = File.new(Rails.root + 'files/hello_world.rb')
      click_button 'Create Snippet'
      page.should have_no_content 'hello_world.rb'
      page.should have_no_content 'puts \'Hello, world!\''
    end

    it "should view detail of a snippet" do
      find("#snippet_show_#{@snippet.id}").click_link 'Show'
      current_path.should == snippet_path(@snippet)
      expect(page).to have_content 'Snippet details'
    end
  end
end
