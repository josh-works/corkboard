class Pro < User
  has_one :pro_service, foreign_key: :user_id

  def services
    Service.where(pro_service[:service_ids])
  end

end
