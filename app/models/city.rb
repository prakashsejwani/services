class City < ActiveRecord::Base
  #extend ActiveSupport::Memoizable 
  before_create :validate_citycount
  
  has_many :localities
#  
#  def name_and_id 
#  " #{name} #{id}"
#  end 
#  memoize :name_and_id 
  validates_uniqueness_of :name, :case_sensitive => false
  validates_presence_of :name
  validates_format_of :name, :with => /^[A-Z]*$/i, :message => "can contain only letters "  
  
    def self.search(search,page)
    paginate :per_page => 10, :page => page,
                   :conditions => ['name like ?',"%#{search}%"],
                   :order => 'name',
                   :select => ['id, name']
    end
    
    protected
    def validate_citycount
      citycount = City.find(:all)
      if citycount.size >= 2
        puts citycount.size.to_yaml
        self.errors.add_to_base("You can not add more cities.")
      end
    end
  
end
