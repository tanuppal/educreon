class CustomerDocument < ApplicationRecord
  belongs_to :document_type, required: false
  belongs_to :customer, required: false

  has_attached_file :document
 validates_attachment_content_type :document,
 :content_type => ["application/zip", "application/pdf", "application/vnd.ms-excel",
 "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "application/msword","application/vnd.openxmlformats-officedocument.wordprocessingml.document","application/vnd.openxmlformats-officedocument.presentationml.presentation","image/png", "image/jpeg","image/gif","image/jpg","image/tiff", "text/plain","video/mp4","video/avi","audio/mpeg","audio/mp3"]
end
