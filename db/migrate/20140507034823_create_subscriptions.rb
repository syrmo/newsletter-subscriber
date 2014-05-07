class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :synced_with_mailchimp, default: false
      t.string :source

      t.timestamps
    end
  end
end
