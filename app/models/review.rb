class Review < ActiveRecord::Base
  
  belongs_to :company, :counter_cache => true
  belongs_to :user
  has_attached_file :review_ad, :styles => { :original => "300x300#", :thumb => "50x50!" }
  email_name_regex  = '[\w\.%\+\-]+'.freeze
  domain_head_regex = '(?:[A-Z0-9\-]+\.)+'.freeze
  domain_tld_regex  = '(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|jobs|museum)'.freeze
  email_regex       = /\A#{email_name_regex}@#{domain_head_regex}#{domain_tld_regex}\z/i
  bad_email_message = "should look like an email address.".freeze
  validates_format_of :email, :with => email_regex, :message => bad_email_message
  validates_presence_of :name,:email,:comment
  #validates_uniqueness_of :name
  named_scope :approved_by_admin, :conditions=>{ 'reviews.approved' => true }
  named_scope :unapproved, :conditions=>{'reviews.approved' => false}  
  named_scope :registered_users, :conditions=>'reviews.user_id is not null'
  named_scope :other_users, :conditions=>'reviews.user_id is null'
  
  attr_accessible :name, :email, :comment, :company_id
  
   def self.approve(reviews)
    reviews.each{|c|
      Review.find(c).update_attribute(:approved, true)
    }
   end
 
 
 
 
end
