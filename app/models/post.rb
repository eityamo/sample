class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    validates :title, :body, presence: true
    validates :body, length: { in: 5..140 }
end
 