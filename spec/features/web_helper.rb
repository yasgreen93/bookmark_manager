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

def sign_up
  visit '/'
  fill_in 'email address', with: 'whatever@gmail.com'
  fill_in 'password', with: '1234567'
  click_button 'Sign up'
end
