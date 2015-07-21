class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :categories, dependent: :destroy
  accepts_nested_attributes_for :categories

  validates :title, presence: true, length:{minimum:5}
end
