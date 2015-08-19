require "test_helper"

class UserIntegrateTest < Capybara::Rails::TestCase
  feature "IndexPage" do
    context "common user" do
      scenario "show index page" do
        visit root_path
        assert_content page, "ふつうのブログ"
      end
    end
  end
end
