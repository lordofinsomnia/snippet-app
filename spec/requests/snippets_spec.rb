require 'rails_helper'

module ::RSpec::Core
  class ExampleGroup
    include Capybara::DSL
    include Capybara::RSpecMatchers
  end
end

RSpec.describe "Snippets", :type => :request do
  describe "GET /snippets" do
    it "display some snippets" do 
    	@snippet = Snippet.create :filename => 'testsnippet.rb',
    														:content => 'test snippet',
    														:output => ''

    	visit snippets_path
    	page.should have_content 'test snippet'      
    end

    it "creates a new snippet" do
    	visit snippets_path
    	fill_in 'Filename', :with => 'testsnippet.rb'
    	fill_in 'Content', :with => 'test snippet'
    	click_button 'Create Snippet'

    	current_path.should == snippets_path
    	page.should have_content 'testsnippet.rb'
    	page.should have_content 'test snippet'


    end


  end
end
