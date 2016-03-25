feature 'user_signin_spec' do

  let(:user) do
    User.create(address: 'user@email.com',
                password: '1234',
                password_confirmation: '1234')
  end

  scenario 'sign in with correct account details' do
    sign_in(address: user.address, password: user.password)
    expect(page).to have_content("Welcome #{user.address}")
  end

end
