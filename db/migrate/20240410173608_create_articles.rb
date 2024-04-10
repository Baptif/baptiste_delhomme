class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :name
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
