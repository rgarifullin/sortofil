require 'test_helper'
require 'capybara/poltergeist'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :poltergeist

  teardown do
    Capybara.reset_sessions!
  end
end
