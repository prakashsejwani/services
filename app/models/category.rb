class Category < ActiveRecord::Base
  
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
  
end
