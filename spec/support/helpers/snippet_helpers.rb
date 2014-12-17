module Features
  module SnippetHelpers
    def go_to_all_snippets      
      visit root_path
      click_link 'Snippets count'
      current_path.should == snippets_path
      expect(page).to have_content 'All snippets'
    end    
  end
end
