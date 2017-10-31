class Comment < ApplicationRecord
  validates :body, presence: true

  belongs_to :author,
  class_name: :User,
  foreign_key: :user_id,
  primary_key: :id

  belongs_to :post,
  class_name: :Post,
  foreign_key: :post_id,
  primary_key: :id

  has_many :child_comments,
  class_name: :Comment,
  foreign_key: :parent_comment_id,
  primary_key: :id

  belongs_to :parent_comments,
  class_name: :Comment,
  foreign_key: :parent_comment_id,
  primary_key: :id,
  optional: true
end
