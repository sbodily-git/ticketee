require "rails_helper"

RSpec.feature "Users can only see the appropriate links" do
  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:user, :admin) }
  let(:the_project) { FactoryGirl.create(:project)}
  
  context "non-admin users" do
    before do
      login_as(user)
      assign_role!(user, :viewer, the_project)
    end # before
    
    scenario "cannot see the New Project link" do
      visit "/"
      expect(page).not_to have_link "New Project"
    end # scenario
    
    scenario "cannot see the Delete Project link" do
      visit project_path(the_project)
      expect(page).not_to have_link "Delete Project"
    end # scenario
    
  end # context
  
  context "admin users" do
    before { login_as(admin) }
    
    scenario "can see the New Project link" do
      visit "/"
      expect(page).to have_link "New Project"
    end # scenario
    
    scenario "can see the Delete Project link" do
      visit project_path(the_project)
      expect(page).to have_link "Delete Project"
    end # scenario
    
  end # context
  
end # Users can only see the appropriate links