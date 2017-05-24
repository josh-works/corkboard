class Pro < User
  has_one :pro_service, foreign_key: :user_id

  def services
    Service.where(id: pro_service[:service_ids])
  end

end
