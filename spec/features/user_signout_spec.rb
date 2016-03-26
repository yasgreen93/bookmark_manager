feature 'user_signout' do
  before(:each) do
    User.create(address: 'email@email.com',
                password: 'password',
                password_confirmation: 'password')
  end

  scenario 'signing out from being signed in' do
    sign_in(address: 'email@email.com', password: 'password')
    click_button('Sign out')
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, email@email.com')
  end
end
