require 'tilt/erb'
feature '/links/index' do
  scenario 'when visitor visits homepage they see links' do
    add_bbc

    visit('/links')
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('BBC')
    end
  end

  scenario 'should be able to jump to add link page' do
    visit('/links')
    click_button('Add link')
    expect(page).to have_content('Submit a new link:')
  end
end
