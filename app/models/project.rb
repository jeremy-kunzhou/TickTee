class Project < ActiveRecord::Base
  validates :name, presence: {message: "Name cannot be blank."}
end
