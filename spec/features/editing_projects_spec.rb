require "rails_helper"

RSpec.feature "Users can edit existing projects" do
  before do
    FactoryGirl.create(:project, name: "Sublime Text 3")
    
    visit "/"
    click_link "Sublime Text 3"
    click_link "Edit Project"
  end # before
  
  scenario "with valid attributes" do
    fill_in "Name", with: "Sublime Text 4 beta"
    click_button "Update Project"
    expect(page).to have_content "Project has been updated."
    expect(page).to have_content "Sublime Text 4 beta"
  end # with valid attributes

  scenario "when providing invalid attributes" do
    fill_in "Name", with: ""
    click_button "Update Project"
    expect(page).to have_content "Project has not been updated."
  end # when providing invalid attributes

end # Users can edit existing projects