class CreateProfileImages < ActiveRecord::Migration[5.2]
  def change
    create_table :profile_images do |t|
      t.string :profile_image_id
      t.integer :user_id

      t.timestamps
    end
  end
end
