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
    	visit snippets_path
    	page.should have_content 'test snippet'      
    end
  end
end
