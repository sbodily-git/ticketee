class Project < ActiveRecord::Base

  has_many :tickets, dependent: :destroy
  has_many :roles, dependent: :delete_all
  
  validates :name, presence: true
    
end # Project
