class UserMailer < ActionMailer::Base
#  def signup_notification(user)
#    setup_email(user)
  #  @subject    = 'Please activate your new account'
  
 #    @body[:url]  = "http://services.econify.com/activate/#{user.activation_code}"
  
 # end
  #  def forgot_login(user)
#    setup_email(user)
#    @subject += "Forgotten account login"
#    @body[:url]  = "http://#{Setting.get(:site_url)}/login"
#  end
  def activation(user)
    setup_email(user)
    @subject    += 'Your account has been activated!'
    @body[:url]  = "http://services.econify.com"
  end

  def forgot_password(user)
     setup_email(user)
     @subject    += 'You have requested to change your password'
     body[:url]  = "http://services.econify.com/reset_password/#{user.password_reset_code}" 
  end

  def reset_password(user)
     setup_email(user)
     @subject    += 'Your password has been reset.'
  end

   def registration_confirm(user)
      recipients   "#{user.email}"
      from         "jrao@econify.com"
      subject      "thank you for registration"
      sent_on      Time.now
      body	   :user => user
   end
  
  def company_approved(company)
    setup_email(company)
    subject  'Your company is listed in services.com'
  end 

  def scroll_ads_approved(company)
    setup_email(company)
   subject  'Your scroll advt has been approved'
  end  
  
  def scroll_ads_unapproved(company)
    setup_email(company)
    subject  'Your scroll advt has been unapproved'
  end  
  
  def scroll_ads_expiry(company)
    setup_email(company)
    subject  'Your scroll advt has expired or is nearing expiry'
  end
  
   def image_ads_unapproved(company)
    setup_email(company)
    subject  'Your image advt has been unapproved'
   end
  
   def image_ads_expiry(company)
    setup_email(company)
    subject  'Your image advt has expired or is nearing expiry'
   end
  
  def image_ads_approved(company)
    setup_email(company)
    subject  'Your image advt has been approved'
  end 
   
  def video_ads_unapproved(company)
    setup_email(company)
    subject  'Your video advt has been unapproved'
  end 
  
  def video_ads_expiry(company)
    setup_email(company)
    subject  'Your video advt has expired or is nearing expiry'
  end
  
  def video_ads_approved(company)
    setup_email(company)
    subject  'Your video advt has been approved'
  end 

  protected
    def setup_email(company)
      recipients    "#{company.email}"
      body          :company => company
      from          "info@amexgroup.in"
      sent_on       Time.now
      content_type  "text/html"
    end
 
end
