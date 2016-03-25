def add_bbc
  visit '/links/new'
  fill_in 'url', with: 'http://www.bbc.co.uk'
  fill_in 'title', with: 'BBC'
  fill_in 'tag', with: 'news'
  click_button 'Submit'
end

def add_zombo
  visit '/links/new'
  fill_in 'url', with: 'http://www.zombo.com/'
  fill_in 'title', with: 'This is Zombocom'
  fill_in 'tag', with: 'kid'
  click_button 'Submit'
end

def add_ruby
  visit '/links/new'
  fill_in 'url', with: 'http://www.ruby-doc.org/'
  fill_in 'title', with: 'ruby docs'
  fill_in 'tag', with: 'ruby programming'
  click_button 'Submit'
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

def sign_in(address:, password:)
  visit '/sessions/new'
  fill_in :address, with: address
  fill_in :password, with: password
  click_button 'Sign in'
end
