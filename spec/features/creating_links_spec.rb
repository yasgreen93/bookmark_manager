require 'tilt/erb'

feature 'creating links' do
  scenario 'I can create a new link' do
    add_zombo
    expect(current_path).to eq '/links'
    within 'ul#links' do
      expect(page).to have_content('This is Zombocom')
    end
  end
end
