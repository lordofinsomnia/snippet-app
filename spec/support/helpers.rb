require 'support/helpers/session_helpers'
require 'support/helpers/snippet_helpers'
RSpec.configure do |config|
  config.include Features::SessionHelpers, type: :feature
  config.include Features::SnippetHelpers, type: :feature
end
