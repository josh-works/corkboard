class Attachment < ApplicationRecord
  belongs_to :attachable, polymorphic: true
  has_attached_file :upload,
                    :storage => :s3,
                    :s3_credentials => Proc.new { |a| a.instance.s3_credentials },
                    :path => '/:class/:attachment/:id_partition/:style/:filename',
                    :url => ':s3_domain_url'
  do_not_validate_attachment_file_type :upload

  def s3_credentials
    {
      :bucket => ENV['S3_BUCKET_NAME'],
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
      :s3_region => ENV['AWS_REGION']
    }
  end
end
