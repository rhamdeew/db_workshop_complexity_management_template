# frozen_string_literal: true

class Category::Article < ApplicationRecord
  include AASM

  has_many :comments, dependent: :destroy
  belongs_to :category, foreign_key: :category_article_id, inverse_of: :articles

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  aasm column: :state do
    state :draft, initial: true
    state :published
    state :archived

    event :publish do
      transitions from: :draft, to: :published
    end

    event :archive do
      transitions from: :published, to: :archived
    end
  end
end
