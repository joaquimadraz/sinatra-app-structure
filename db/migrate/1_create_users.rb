class CreateUsers < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :avatar_url
      t.string :email
      t.string :name
      t.string :twitter_uid
      t.string :twitter_handler
      t.boolean :registration_complete

      t.timestamps
    end
  end

end
