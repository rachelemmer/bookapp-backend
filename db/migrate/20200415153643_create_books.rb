class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :image
      t.string :api_id
      t.references :user
      t.timestamps
    end
  end
end
