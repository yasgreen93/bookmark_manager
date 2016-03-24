require './app/models/link'

feature "View links" do
  scenario "see a list of links on the links page" do
    # Link.create(url: "http://www.viewlinksspec.com/", title: "View links")
    visit '/add_link'
    fill_in :title, with: 'Sky Sports'
    fill_in :url, with: 'www.skysports.com'
    fill_in :tags, with: 'sports'
    click_button 'Add link'

    # visit "/links"

    expect(page.status_code).to eq 200

    within "ul#links" do
      expect(page).to have_content("Sky Sports")
    end
    # Link.all.destroy

  end
end
