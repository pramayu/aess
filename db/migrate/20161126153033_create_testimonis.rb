class CreateTestimonis < ActiveRecord::Migration
  def change
    create_table :testimonis do |t|
      t.string :name
      t.string :content
      t.string :avatar
      t.string :occupation

      t.timestamps null: false
    end
  end
end
