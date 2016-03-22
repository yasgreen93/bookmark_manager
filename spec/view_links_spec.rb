feature "View links" do
  scenario "see a list of links on the links page" do
    Link.create(name: "Makers Academy", url: "http://www.makersacademy.com/" )
    visit "/links"
    within "ul#links" do
      expect(page).to have_content("Makers Academy")
    end
  end
end
