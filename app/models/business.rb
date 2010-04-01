class Business < ActiveRecord::Base
  #has_many :categories
  
  validates_uniqueness_of :name, :case_sensitive => false
  validates_presence_of :name
  validates_format_of :name, :with => /^[A-Z. ]*$/i, :message => "can contain only letters and dash sigh "  
  validates_length_of :alphabet, :maximum => 1, :allow_nil => false
  
    def self.search(search,page)
    paginate :per_page => 15, :page => page,
                   :conditions => ['name like ?',"%#{search}%"],
                   :order => 'name',
                   :select => ['id, name, alphabet']
    end
end
