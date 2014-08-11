require 'rails_helper'

describe "/api/v1/projects", type: :api do
  let!(:user) {FactoryGirl.create(:user)}
  let!(:token) {user.authentication_token}
  let!(:project) {FactoryGirl.create(:project, user: user)}
  let!(:project_other) {FactoryGirl.create(:project, name: "Others Project")}
  let!(:headers) {{'HTTP_X_API_EMAIL' => user.email, 'HTTP_X_API_TOKEN' => token}}
  let!(:new_project) { 
    {
      name: "Example project", 
      description: "Description for project", 
      start_at: "2014-07-01", 
      end_at: "2014-08-01", 
      expected_progress: 20,
      current_progress: 10,
      user_id: user.id
    }
  }
  before :each do
    user.confirm!
  end
  
  context "projects view" do
    let(:url) { "/api/v1/projects"}
    it "projects viewable by this user" do
      get "#{url}.json", {}, headers
      
      projects_json = user.projects.to_json
      expect(last_response.body).to eq(projects_json)
      expect(last_response.status).to eq(200)
      
      projects = JSON.parse(last_response.body)
      
      projects.any? do |p|
        p["name"] == project.name
      end.should eql(true)
    end
    
    it "projects belong to other user unviewable by this user" do
      get "#{url}.json", {}, headers
      
      projects_json = user.projects.to_json
      expect(last_response.body).to eq(projects_json)
      expect(last_response.status).to eq(200)
      
      projects = JSON.parse(last_response.body)   
      
      projects.any? do |p|
        p["name"] == "Others Project"
      end.should eql(false)
    end
  end
  
  context "projects create" do 
    let(:url) { "/api/v1/projects"} 
    
    it "create projects" do 
      post "#{url}.json", {project: new_project}, headers
      
      expect(last_response.status).to eq(201)
      expect(last_response.body).to include(new_project[:name])
    end
    
    it "cannot create project without token" do
      post "#{url}.json", {project: new_project}
      
      expect(last_response.status).to eq(401)
      expect(last_response.body).to include("error")
    end
  end
  
  context "projects update" do 
    let(:url) { "/api/v1/projects/#{project.id}"} 
    let(:update_project) {
      new_project[:current_progress] = 30
      new_project
    }
    it "update project" do 
      put "#{url}.json", {project: update_project}, headers
      
      expect(last_response.status).to eq(201)
      json_body = JSON.parse(last_response.body)
      expect(json_body).to have_key('current_progress')
      expect(json_body["current_progress"]).to eq(update_project[:current_progress])
    end
    
    it "cannot update project without token" do 
      put "#{url}.json", {project: project.to_json}
      
      expect(last_response.status).to eq(401)
      expect(last_response.body).to include("error")
    end
  end
end