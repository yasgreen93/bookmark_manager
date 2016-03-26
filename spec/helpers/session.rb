module SessionHelpers

  def sign_in(address:, password:)
    visit '/sessions/new'
    fill_in :address, with: address
    fill_in :password, with: password
    click_button 'Sign in'
  end

  def sign_up(email: 'whatever@gmail.com',
              password: '12345',
              password_confirmation: '12345')
    visit '/users/sign_up'
    fill_in :email, with: email
    fill_in :pw, with: password
    fill_in :pw_conf, with: password_confirmation
    click_button 'Sign up'
  end

end
