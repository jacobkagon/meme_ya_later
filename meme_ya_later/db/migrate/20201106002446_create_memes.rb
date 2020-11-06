class CreateMemes < ActiveRecord::Migration[6.0]
  def change
    create_table :memes do |t|
      t.string :url
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
