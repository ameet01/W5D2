class Post < ApplicationRecord
  validates :title, presence: true
  validates :subs, presence: { message: "you need 1 sub" }

  belongs_to :author,
  class_name: :User,
  foreign_key: :user_id,
  inverse_of: :posts

  has_many :comments,
  class_name: :Comment,
  foreign_key: :post_id,
  primary_key: :id

  has_many :post_subs, dependent: :destroy, inverse_of: :post
  has_many :subs, through: :post_subs, source: :sub

  def comments_by_parent_id
    hash = Hash.new { |hash, key| hash[key] = [] }

    self.comments.includes(:author).each do |comment|
      hash[comment.parent_comment_id] << comment
    end

    hash
  end
end
