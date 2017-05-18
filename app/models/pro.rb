class Pro < User
  has_one :pro_setting, foreign_key: :user_id
  has_one :industry, through: :pro_setting
end
