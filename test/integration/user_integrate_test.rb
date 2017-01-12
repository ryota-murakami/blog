require 'test_helper'

class UserIntegrateTest < Capybara::Rails::TestCase
  feature 'device' do
    context 'common user' do
      scenario 'login' do
        visit new_user_session_path
        assert_content 'Log in'

        fill_in 'user[email]', with: 'test@example.org'
        fill_in 'user[password]', with: '123greetings'

        click_on 'Log in'

        assert_current_path root_path

        assert_content '新しい投稿'
      end
    end
  end
end
