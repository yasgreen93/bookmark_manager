require './app/models/link'

feature 'Adding links' do
  scenario 'it can create additional links' do
    visit "/add_link"
    fill_in(:title, with: "Makers Academy")
    fill_in(:url, with: "http://www.makersacademy.com/")
    click_button("Add link")
    expect(page).to have_content("Makers Academy")
    expect(page).to have_content("http://www.makersacademy.com/")
  end
end
