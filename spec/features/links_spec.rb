require 'tilt/erb'
feature '/links/index' do
  before(:each) do
    User.create(address: 'email@email.com',
                password: 'password',
                password_confirmation: 'password')
  end

  scenario 'when visitor visits homepage they see links' do
    sign_in(address: 'email@email.com', password: 'password')
    add_bbc
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('BBC')
    end
  end

  scenario 'should be able to jump to add link page' do
    sign_in(address: 'email@email.com', password: 'password')
    click_button('Add link')
    expect(page).to have_content('Submit a new link:')
  end
end
