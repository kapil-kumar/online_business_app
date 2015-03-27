class Post < ActiveRecord::Base
  belongs_to :user
  validates :title,:subject,:description,:presence => true
  has_attached_file :image,:styles => {:medium => "300x300>"}
end
