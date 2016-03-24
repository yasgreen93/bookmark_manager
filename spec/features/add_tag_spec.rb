feature 'Add tags' do
  scenario 'add tag' do
    add_sky
    expect(page).to have_content('sports')
  end
end
