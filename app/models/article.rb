# frozen_string_literal: true

class Article < ApplicationRecord
  include AASM

  has_many :comments, dependent: :destroy
  belongs_to :category

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
