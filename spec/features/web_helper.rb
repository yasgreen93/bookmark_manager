def add_bbc
  click_button 'Add link'
  fill_in 'url', with: 'http://www.bbc.co.uk'
  fill_in 'title', with: 'BBC'
  fill_in 'tag', with: 'news'
  click_button 'Submit'
end

def add_zombo
  click_button 'Add link'
  fill_in 'url', with: 'http://www.zombo.com/'
  fill_in 'title', with: 'This is Zombocom'
  fill_in 'tag', with: 'kid'
  click_button 'Submit'
end

def add_ruby
  click_button 'Add link'
  fill_in 'url', with: 'http://www.ruby-doc.org/'
  fill_in 'title', with: 'ruby docs'
  fill_in 'tag', with: 'ruby programming'
  click_button 'Submit'
end
