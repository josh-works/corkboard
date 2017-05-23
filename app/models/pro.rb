class Pro < User
  has_one :pro_service, foreign_key: :user_id

  def service(service = nil)
    Service.find_by(name: service)
  end

end


# pro.pro_service[:service_ids] = services
