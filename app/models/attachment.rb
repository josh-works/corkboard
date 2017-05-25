class Attachment < ApplicationRecord
  belongs_to :attachable, polymorphic: true
  has_attached_file :upload
  do_not_validate_attachment_file_type :upload
end
