class Video < ActiveRecord::Base
  belongs_to :asset, :polymorphic => true # Polymorphism!
                 
 has_attached_file :video
       
  validates_attachment_presence :video
  validates_attachment_content_type :video, 
                                    :content_type => [  "application/octet-stream", 'video/x-flv', 'video/flv' ],
                                    :message => 'only flv files are allowed'                    
  validates_attachment_size :video, :less_than =>50.megabytes , :message =>'max size is 10MB'  
  #attr_accessible :video_file_name, :video_content_type, :video_file_size 
  
end