feature 'tagging links' do
  scenario 'add a single tag to a link' do
    add_bbc
    expect(page).to have_content('News')
  end
end
