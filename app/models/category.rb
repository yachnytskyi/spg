class Category < ApplicationRecord
  belongs_to :user
  has_many :topics

  validates_presence_of :title
end
