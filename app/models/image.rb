class Image < ActiveRecord::Base
  belongs_to :asset, :polymorphic => true # Polymorphism!
  
  
  has_attached_file :ad, :styles => {:original => "380x300!", :thumb => "100x100!" }
 
  validates_attachment_presence :ad
  validates_attachment_content_type :ad, 
                                    :content_type => [ 'image/png', 'image/jpeg', 'image/jpg',
                                                         'image/gif', 'image/pjpeg','image/x-png' ],
                                     :message => 'only image files are allowed'                    
  validates_attachment_size :ad, :less_than => 2.megabytes , :message =>'max size is 2MB'  
  
  
  #attr_accessible :ad_file_name, :ad_content_type, :ad_file_size 
  
end
