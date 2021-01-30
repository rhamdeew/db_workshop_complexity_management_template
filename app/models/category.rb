# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :articles, foreign_key: :category_article_id, inverse_of: :category, dependent: :destroy

  validates :name, presence: true
end
