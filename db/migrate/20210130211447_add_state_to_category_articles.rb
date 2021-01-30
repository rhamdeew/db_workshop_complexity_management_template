class AddStateToCategoryArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :category_articles, :state, :string
  end
end
