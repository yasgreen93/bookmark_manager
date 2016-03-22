
feature '/' do
  scenario 'when visitor visits homepage they see links' do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')

    visit('/links')
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end
end
