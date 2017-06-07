require 'rails_helper'

describe Attachment do
  attr_reader :attachment

  before do
    @attachment = Attachment.create(id: 1000,
                                   attachable_id: 201,
                                   attachable_type: "Project",
                                   upload_file_name: "what",
                                   upload_content_type: "image/jpeg",
                                   upload_file_size: 50)
  end
  context 'relationships' do
    it 'belongs to attachable' do
      expect(attachment).to respond_to(:attachable)
      expect(attachment).to respond_to(:upload)
    end
  end

  context 'attributes' do
    it 'has attributes' do
      expect(attachment).to respond_to(:attachable_id)
      expect(attachment).to respond_to(:attachable_type)
      expect(attachment).to respond_to(:upload_file_name)
      expect(attachment).to respond_to(:upload_content_type)
      expect(attachment).to respond_to(:upload_file_size)
    end
  end
end
