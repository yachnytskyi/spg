class Category < ApplicationRecord
  belongs_to :user
  has_many :topics, dependent: :destroy

  validates_presence_of :title
end
