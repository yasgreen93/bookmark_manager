require 'tilt/erb'

feature 'creating links' do
  before(:each) do
    User.create(address: 'email@email.com',
                password: 'password',
                password_confirmation: 'password')
  end

  scenario 'I can create a new link' do
    sign_in(address: 'email@email.com', password: 'password')
    add_zombo
    expect(current_path).to eq '/links'
    within 'ul#links' do
      expect(page).to have_content('This is Zombocom')
    end
  end
end
