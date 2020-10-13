# frozen_string_literal: true

# article model.
class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
end
