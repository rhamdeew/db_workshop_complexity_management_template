class DropCategoryFromArticles < ActiveRecord::Migration[6.1]
  def change
    remove_reference :articles, :category, foreign_key: true
  end
end
