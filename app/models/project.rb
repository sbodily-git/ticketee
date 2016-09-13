class Project < ActiveRecord::Base

  has_many :tickets, dependent: :destroy
  has_many :roles, dependent: :delete_all
  
  validates :name, presence: true
    
  def has_member?(user)
    roles.exists?(user_id: user)
  end # has_member
  
  [:manager, :editor, :viewer].each do |role|
    define_method "has_#{role}?" do |user|
      roles.exists?(user_id: user, role: role)
    end # has_#{role}
  end # each
    
end # Project
