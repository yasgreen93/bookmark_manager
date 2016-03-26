feature 'Filtering with tags' do

  before(:each) do
    User.create(address: 'email@email.com',
                password: 'password',
                password_confirmation: 'password')
  end

  scenario 'can filter links with a tag' do
    sign_in(address: 'email@email.com', password: 'password')
    add_bbc
    add_zombo
    fill_in 'tags', with: 'news'
    click_button 'Filter'
    expect(page).to have_content('BBC')
    expect(page).not_to have_content('This is Zombocom')
  end
end
