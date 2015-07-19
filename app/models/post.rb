class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :categories, dependent: :destroy

  validates :title, presence: true, length:{minimum:5}
end
