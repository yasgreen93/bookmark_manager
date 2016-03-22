require 'tilt/erb'
require 'database_cleaner'


feature 'creating links' do
  
  before do 
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
  end

  scenario 'should have a form to submit a link' do
    visit '/links/new'
    expect(page).to have_field('title')
    expect(page).to have_button('Submit')
  end

  scenario 'I can create a new link' do
    visit '/links/new'
    fill_in 'url', with: 'http://www.zombo.com/'
    fill_in 'title', with: 'This is Zombocom'
    click_button 'Submit'
    expect(current_path).to eq '/links'
    within 'ul#links' do
      expect(page).to have_content('This is Zombocom')
    end
  end
end
