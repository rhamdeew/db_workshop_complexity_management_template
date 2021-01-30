class AddCategoryArticleToCategoryArticles < ActiveRecord::Migration[6.1]
  def change
    add_reference :category_articles, :category_article, foreign_key: true
  end
end
