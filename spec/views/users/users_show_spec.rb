require 'rails_helper'

RSpec.feature 'User Profile Page', type: :feature do
  let(:user) do
    User.create(
      name: 'Vilis',
      posts_counter: 30
    )
  end

  before do
    visit user_path(user)
  end

  scenario 'displays user information correctly' do
    expect(page).to have_css('.userNameWrapper')
    expect(page).to have_css('.userName h2', text: "Name: #{user.name}")
    expect(page).to have_css('.userName h6', text: "Number of posts: #{user.posts.count}")
    expect(page).to have_css('.bio h3', text: 'Bio:')
    expect(page).to have_css('.bio p', text: user.bio)

    user.recent_posts.each_with_index do |post, index|
      within(page.all('.post')[index]) do
        expect(page).to have_css('h3', text: "Post ##{index + 1}")
        if post.text.split.length <= 18
          expect(page).to have_css('p', text: post.text)
        else
          expect(page).to have_css('p', text: "#{post.text.split.take(18).join(' ')}...")
        end
        expect(page).to have_css('.count', text: "Comments: #{post.comments.count}")
        expect(page).to have_css('.count', text: "Likes: #{post.likes.count}")
      end
    end

    expect(page).to have_css('.button #all-posts-link', text: 'See all posts')
  end
end
