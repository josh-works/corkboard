class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :body, :rating, :user_id, :pro_id
end
