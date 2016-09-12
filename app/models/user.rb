class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :excluding_archived, lambda { where(archived_at: nil) }

  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end # to_s

  def archive
    self.update(archived_at: Time.now)
  end # archive

  def active_for_authentication?
    super && archived_at.nil?
  end # active_for_authentication?

  def inactive_message
    archived_at.nil? ? super : :archived
  end # inactive_message

end # User