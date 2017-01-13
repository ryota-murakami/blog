require 'test_helper'

class UserIntegrateTest < Capybara::Rails::TestCase
  before do
    visit new_user_session_path

    fill_in 'user[email]', with: 'test@example.org'
    fill_in 'user[password]', with: '123greetings'

    click_on 'Log in'
  end

  feature 'device' do
    context 'common user' do
      scenario 'login' do
        click_on '新しい投稿'

        fill_in 'post[title]', with: 'test title'
        fill_in 'post[text]', with: 'test text'
        fill_in 'post[categories_attributes][0][name]', with: 'test category'

        click_on 'Create Post'

        assert_current_path /posts\/\d+/

        assert_content 'test title'
        assert_content 'test text'
        assert_content 'test category'
      end
    end
  end
end
