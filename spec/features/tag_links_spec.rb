require 'tilt/erb'

feature 'tagging links' do
  scenario 'add a single tag to a link' do
    add_bbc
    expect(page).to have_content('news')
  end

  scenario 'add multiple tags to a link' do
    add_ruby
    within 'ul#links' do
      expect(page).to have_content('Tag: ruby, programming')
    end
  end
end
