class Pro < User
  has_one :pro_setting, foreign_key: :user_id

  def service(service = nil)
    Service.find_by(name: service)
  end

end
