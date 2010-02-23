class Category < ActiveRecord::Base
  named_scope :popular, :conditions => {:popular => true}, :order => "name ASC"
  named_scope :unpopular, :conditions => {:popular => false}, :order => "name ASC"  
    
  # For Thinking-sphinx search
  define_index do
    indexes :name, :sortable => true
    indexes companies.name, :as => :company

    # For auto indexing 
    set_property :delta => true
    set_property :match_mode => :any
  end
  
  has_many :categorizations, :dependent => :destroy
  has_many :companies, :through => :categorizations
  #belongs_to :bussiness
  
  #validates_presence_of :name, :business_id
  validates_uniqueness_of :name
  validates_format_of :name, :with => /^[A-Z. ]*$/i, :message => "can contain only letters and dash sigh "  
      

  def self.pages(page, q)
    paginate :per_page => 20, :page => page,
             :conditions => ["name like ?", "%#{q}%"], 
             :order => 'name'
  end
  
  def self.send_to_popular(categories)
    categories.each do |c| 
      category = Category.find(c) 
      category.update_attribute(:popular, true) 
    end    
  end
  
  def self.send_to_unpopular(categories)
    categories.each do |c| 
      category = Category.find(c)  
      category.update_attribute(:popular, false)
    end 
  end
  
end
