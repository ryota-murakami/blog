require "test_helper"

class UserIntegrateTest < Capybara::Rails::TestCase
  test "show index page" do
    visit root_path
    assert_content page, "ふつうのブログ"
  end
end
