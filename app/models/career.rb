class Career < ActiveRecord::Base
  has_attached_file :resume,  
                    :url  => "/assets/careers/:id/:basename.:extension",
                    :path => ":rails_root/public/assets/careers/:id/:basename.:extension"

  #validates_attachment_presence :resume
  validates_attachment_size :resume, :less_than => 5.megabytes
  validates_attachment_content_type :resume, :content_type => ['application/msword', 'application/pdf']
end
