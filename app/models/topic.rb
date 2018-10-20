class Topic < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :replies, dependent: :destroy

  validates_presence_of :title, :body
  resourcify

end
