require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include Warden::Test::Helpers # needed to use login_as method in tests
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
end
