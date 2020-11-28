class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
  validates :body, presence: true, length: { minimum: 3, maximum: 300 }
end
