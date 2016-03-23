
feature '/links/index' do
  scenario 'when visitor visits homepage they see links' do
    add_bbc

    visit('/links')
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('BBC')
    end
  end
end
