class Subscription < ActiveRecord::Base
  NEWSLETTER_LIST_ID = '3997e16b1e'

  validates_presence_of :email
  validates_uniqueness_of :email

  def add_to_mailchimp!
    gibbon.lists.subscribe({
      id: NEWSLETTER_LIST_ID, 
      email: {
        email: self.email
      }, 
      merge_vars: {
        :FNAME => self.first_name, 
        :LNAME => self.last_name
      }, 
      :double_optin => false
    })
    update_column(:synced_with_mailchimp, true)
  end

  private 

    def gibbon
      @gibbon ||= Gibbon::API.new
    end

end
