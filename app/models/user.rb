class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :zipcode, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true
  has_secure_password validations: false
  has_many :user_roles
  has_many :roles, through: :user_roles

  def self.from_omniauth(auth_info)
  user = where(uid: auth_info[:uid]).first_or_initialize do |new_user|
    new_user.uid = auth_info.uid
  end
 end

 def self.name_from_oauth(oauth_info)
   full_name = oauth_info["info"]["name"].split(' ')
   { first: full_name[0], last: full_name[1] }
 end

 def self.locate_by(data, oauth=false)
  oauth ? find_or_initialize_by(uid: data["uid"]) : find_by(email: data)
 end

 def full_name
   "#{first_name} #{last_name}"
 end
end
