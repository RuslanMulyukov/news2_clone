class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :new

  validates :result, :presence => true
  validates_length_of :sex, :in => 2..4
end
