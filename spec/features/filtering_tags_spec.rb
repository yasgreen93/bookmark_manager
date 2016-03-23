feature 'Filtering with tags' do

  scenario 'can filter links with a tag' do
    add_bbc
    add_zombo
    fill_in 'tags', with: 'news'
    click_button 'Filter'
    expect(page).to have_content('BBC')
    expect(page).not_to have_content('This is Zombocom')
  end
end
