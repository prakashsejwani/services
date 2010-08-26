class Company < ActiveRecord::Base
  
 # For Thinking-sphinx search 
  define_index do
    indexes :name, :sortable => true
    indexes :city_id, :as => :city
    indexes :locality_id, :as => :locality
    indexes categories.name,  :as => :category_name
    indexes :priority, :sortable => true
    
    # attribute
    has approved
    #has categories(:name), :as => :category_name

    # For auto indexing 
    #set_property :delta => true
    set_property :match_mode => :any
  end
  
  #acts_as_taggable_on :tags
  acts_as_polymorphic_paperclip #:counter_cache => true
  ajaxful_rateable :dimensions => [], :allow_update => true
 # before_update :add_category
  belongs_to :business
  belongs_to :city
  belongs_to :locality  
  belongs_to :user
  has_many :reviews
  has_many :categorizations, :dependent => :destroy
  has_many :categories, :through => :categorizations
  has_many :images, :as => :asset, :dependent => :destroy
  has_attached_file :image_ad, :styles => { :medium => "300x300>", :thumb => "89x57#" }
  has_one  :video, :as => :asset, :dependent => :destroy
  validates_presence_of :name, :address1, :locality_id, :city_id, :business_id, :email
  validates_uniqueness_of :name
  named_scope :approved_by_admin, :conditions=>{ 'companies.approved' => true }
  named_scope :unapproved, :conditions=>{'companies.approved' => false}  
  named_scope :city, lambda { |city| {:conditions=>['companies.city_id =?', city]} }
  named_scope :locality, lambda { |locality| {:conditions=>['companies.locality_id =?', locality]} }
  named_scope :by_name, lambda { |company| {:conditions=>"companies.name like '%"+company+"%'"} }
  named_scope :near_expiry, {:conditions => ['companies.scroll_ads = ? AND companies.to_date is not null', true]}
  named_scope :image_near_expiry, {:conditions => ['companies.imageapprove = ? AND companies.image_to_date is not null', true]}
  named_scope :video_near_expiry, {:conditions => ['companies.videoapprove = ? AND companies.video_to_date is not null', true]}
  named_scope :popular, { :conditions => {:popular_catlog =>  true }, :order => "name ASC"}
  named_scope :not_popular, {:conditions => {:popular_catlog => false}, :order => "name ASC"}
  named_scope :popular_service, {:conditions => {:popular_services => true}, :order => "name ASC"}
  named_scope :unpopular_service, {:conditions => {:popular_services => false}, :order => "name ASC"}
  
  attr_accessible :name, :address1, :address2, :approved
  attr_accessor :category_ids
  
  def self.approve(companies)
    companies.each{|c|
      comp = Company.find(c)
      UserMailer.deliver_company_approved(comp)
      comp.update_attribute(:approved, true)      
    }
  end
   
  def self.send_mail_for_company_expiry(comp)
    comp.each{|c|
    com = Company.find(c)
#    if ((com.to_date - Date.today).to_i < 30)
#    if ((com.to_date - Date.today).to_i <= 0)
      com.update_attribute(:scroll_ads, false)
     UserMailer.deliver_scroll_ads_unapproved(com)
#    end
#  end
  }
  end

  def self.srch(search='', city=nil, locality=nil, page=1, category=false)  
      paginate :per_page => 10, :page => page,
           :conditions => ['name like ?', "#{search}%"], 
           :include => [:locality, :city, :business, :categorizations, :images],
           :select => ('id, name, locality_id, city_id, business_id,approved,other_category'),
           :order => 'name'
  end
   
  def category_ids=(category_ids)
    unless category_ids.nil?
      self.categorizations.each do |c|
        c.destroy unless category_ids.include?(c.category_id.to_s)
        category_ids.delete(c.category_id.to_s)
      end 
      category_ids.each do |p|
        self.categorizations.build(:category_id => p) unless p.blank?
      end
      self.category_ids = nil
    end
  end
  
  def category_ids
    self.categorizations.collect{|c| c.category_id}
  end
 
  def self.find_by_category(page=1, cat_id='')
     paginate :per_page=>5, :page=>page,
     :conditions => ['companies.id in(select company_id from categorizations where category_id = ?)', cat_id]
  end
  
  def self.send_to_popular(companies)    
    companies.each do |c|
      company = Company.find(c)
      company.update_attribute(:popular_catlog, true)
    end    
  end
  
  def self.send_to_unpopular(companies)
    companies.each do |c|
      company = Company.find(c)
      company.update_attribute(:popular_catlog, false)
    end
  end
  
  def self.send_to_popular_service(companies)    
    companies.each do |c|
      company = Company.find(c)
      company.update_attribute(:popular_services, true)
    end    
  end
  
  def self.send_to_normal_service(companies)
    companies.each do |c|
      company = Company.find(c)
      company.update_attribute(:popular_services, false)
    end
  end
   
end
