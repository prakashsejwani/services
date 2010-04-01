require 'digest/sha1'

class User < ActiveRecord::Base
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken
  include Authorization::AasmRoles
  # Relations
  has_and_belongs_to_many :roles
  has_one :profile
  has_many :companies
  has_many :reviews
  has_attached_file :avatar, :styles => { :medium => "150x150", :thumb => "50x50#" }
  ajaxful_rater            
  
  email_name_regex  = '[\w\.%\+\-]+'.freeze
  domain_head_regex = '(?:[A-Z0-9\-]+\.)+'.freeze
  domain_tld_regex  = '(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|jobs|museum)'.freeze
  email_regex       = /\A#{email_name_regex}@#{domain_head_regex}#{domain_tld_regex}\z/i
  bad_email_message = "should look like an email address.".freeze
  
  # Validations
  validates_presence_of :login, :if => :not_using_openid?
  validates_length_of :login, :within => 3..40, :if => :not_using_openid?
  validates_uniqueness_of :login, :case_sensitive => false, :if => :not_using_openid?
  validates_format_of :login, :with => /\A\w[\w\.\-_@]+\z/, :message => "use only letters, numbers, and .-_@ please.", :if => :not_using_openid?
  validates_format_of :name, :with => /\A[^[:cntrl:]\\<>\/&]*\z/, :message => "avoid non-printing characters and \\&gt;&lt;&amp;/ please.", :allow_nil => true
  validates_length_of :name, :maximum => 100
  validates_presence_of :email, :if => :not_using_openid?
  validates_length_of :email, :within => 6..100, :if => :not_using_openid?
  validates_uniqueness_of :email, :case_sensitive => false, :if => :not_using_openid?
  validates_format_of :email, :with => email_regex, :message => bad_email_message, :if => :not_using_openid?
  validates_uniqueness_of :identity_url, :unless => :not_using_openid?
  validate :normalize_identity_url
    
  # Hooks
  after_create :create_profile
  
  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :name, :password, :password_confirmation, :identity_url
  
  # has_role? simply needs to return true or false whether a user has a role or not.  
  # It may be a good idea to have "admin" roles return true always
  def has_role?(role)
    list ||= self.roles.collect(&:name)
    list.include?(role.to_s) || list.include?('admin')
  end
  # Activates the user in the database.
  def activate!
    @activated = true
    self.activated_at = Time.now.utc
    self.activation_code = nil
    save(false)
  end

  # Returns true if the user has just been activated.
  def recently_activated?
    @activated
  end

  def active?
    # the existence of an activation code means they have not activated yet
    activation_code.nil?
  end
  
  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  def self.authenticate(login, password)
    #u = find_in_state :first, :active, :conditions => {:login => login} # need to get the salt
    u = find :first, :active, :conditions => {:login => login} # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  def not_using_openid?
    identity_url.blank?
  end
  
  def password_required?
    new_record? ? not_using_openid? && (crypted_password.blank? || !password.blank?) : !password.blank?
  end

  def normalize_identity_url
    self.identity_url = OpenIdAuthentication.normalize_url(identity_url) unless not_using_openid?
  rescue
    errors.add_to_base("Invalid OpenID URL")
  end
  
  # Creates a new password for the user, and notifies him with an email
  def reset_password!
    password = PasswordGenerator.random_pronouncable_password(3)
    self.password = password
    self.password_confirmation = password
    self.password_reset_code = nil
    save
    
    UserMailer.deliver_reset_password(self)
  end
  
  def forgot_password
    self.make_password_reset_code
    save
    UserMailer.deliver_forgot_password(self)
  end
  
  def self.find_by_login_or_email(login_or_email)
    find(:first, :conditions => ['login = ? OR email = ?', login_or_email, login_or_email])
  rescue
    nil
  end
    
protected

  def make_activation_code
    self.deleted_at = nil
    self.activation_code = self.class.make_token
  end

    def make_password_reset_code
    self.password_reset_code = Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join )
    end
  
  def create_profile
    # Give the user a profile
    self.profile = Profile.create    
  end
  
# --------

  # Virtual attribute for the unencrypted password
  # attr_accessor :password
  
  # Per page pagination
  # TODO: Replace with searchgasm
  # cattr_reader :per_page
  # @@per_page = 25




  # Encrypts some data with the salt.
   def self.encrypt(password, salt)
  #   Digest::SHA1.hexdigest("--#{salt}--#{password}--")
      password_digest(password, salt)
   end


  

  
    # before filter 
    # def encrypt_password
    #   return if password.blank?
    #   self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{login}--") if new_record?
    #   self.crypted_password = encrypt(password)
    # end
    

    
    # def do_delete
    #   self.deleted_at = Time.now.utc
    # end
    # 
    # def do_activate
    #   self.activated_at = Time.now.utc
    #   self.deleted_at = self.activation_code = nil
    # end
    

end
