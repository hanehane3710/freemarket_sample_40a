class CreateCategoryItems < ActiveRecord::Migration[5.1]
  def change
    create_table :category_items do |t|
      t.references    :item,     null: false, foreign_key: true
      t.references    :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
