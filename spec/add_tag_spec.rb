feature 'Add tags' do
  scenario 'add tag' do
    visit '/add_link'
    fill_in :title, with: 'Sky Sports'
    fill_in :url, with: 'www.skysports.com'
    fill_in :tags, with: 'sports'
    click_button 'Add link'
    expect(page).to have_content('sports')
  end
end
