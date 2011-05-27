class New < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :votes
  has_many :comments

  validates :title, :description, :presence => true
  validates_uniqueness_of :title
  validates_length_of :title, :in => 5..150
end
