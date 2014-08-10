require 'rails_helper'

describe "/api/v1/projects", type: :api do
  let!(:user) {FactoryGirl.create(:user)}
  let!(:token) {user.authentication_token}
  let!(:project) {FactoryGirl.create(:project, user: user)}
  let!(:project_other) {FactoryGirl.create(:project, name: "Others Project")}
  
  before :each do
    user.confirm!
  end
  
  context "projects viewable by this user" do
    let(:url) { "/api/v1/projects"}
    it "json" do
      get "#{url}.json", {}, {'HTTP_X_API_EMAIL' => user.email, 'HTTP_X_API_TOKEN' => token}
      
      projects_json = user.projects.to_json
      expect(last_response.body).to eq(projects_json)
      expect(last_response.status).to eq(200)
      
      projects = JSON.parse(last_response.body)
      
      projects.any? do |p|
        p["name"] == project.name
      end.should eql(true)
      
      projects.any? do |p|
        p["name"] == "Others Project"
      end.should eql(false)
    end
  end
end