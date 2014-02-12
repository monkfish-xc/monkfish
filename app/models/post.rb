# == Schema Information
#
# Table name: posts
#
#  id              :integer          not null, primary key
#  content         :string(255)
#  title           :string(255)
#  leading_comment :string(255)
#  user_id         :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Post < ActiveRecord::Base
  belongs_to :user

  has_many :comments, as: :commentable

  default_scope -> { order('created_at DESC') }
  
  validates :user_id, presence: true
  VALID_URL_REGEX = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix
  validates :content, presence: true, format: { with: VALID_URL_REGEX }
  validates :title, presence: true, length: { maximum: 150 }
end
