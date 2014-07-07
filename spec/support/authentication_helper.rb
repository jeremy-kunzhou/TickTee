
include Warden::Test::Helpers
Warden.test_mode!
def as_user(user, &block)
  current_user = user || Factory.create(:user)
  if defined? request
    sign_in(current_user)
  else
    login_as(current_user, scope: :user)
  end
  block.call if block.present?
  return self
end

def as_visitor(user=nil, &block)
  current_user = user || Factory.stub(:user)
  if rdefined? equest
    sign_out(current_user)
  else
    logout(:user)
  end
  block.call if block.present?
  return self
end

def sign_in_as(user)
  visit '/users/sign_in'
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
  expect(page).to have_content("Signed in successfully")
end

RSpec.configure do |config|
  config.after(:each) {Warden.test_reset!}
end