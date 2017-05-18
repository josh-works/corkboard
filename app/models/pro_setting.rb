class ProSetting < ApplicationRecord
  belongs_to :industry
  belongs_to :pro, foreign_key: :user
end
