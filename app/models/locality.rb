class Locality < ActiveRecord::Base
  belongs_to :city
  
  validates_presence_of :name, :city_id
  validates_uniqueness_of :name
  validates_numericality_of :city_id
  validates_format_of :name, :with => /^[A-Z() ]*$/i, :message => "can contain only letters"
  
    def self.search(search,page)
    paginate :per_page => 10, :page => page,
                   :conditions => ['name like ?',"%#{search}%"],
                   :order => 'name',
                   :select => ['id, name, city_id']
    end
  
end
