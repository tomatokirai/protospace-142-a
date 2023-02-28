class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :prototype

  validates :Comment, presence: true
end
