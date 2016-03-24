def add_sky
  visit '/add_link'
  fill_in :title, with: 'Sky Sports'
  fill_in :url, with: 'www.skysports.com'
  fill_in :tags, with: 'sports'
  click_button 'Add link'
end
