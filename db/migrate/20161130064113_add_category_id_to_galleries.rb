class AddCategoryIdToGalleries < ActiveRecord::Migration
  def change
    add_reference :galleries, :category, index: true, foreign_key: true
  end
end
