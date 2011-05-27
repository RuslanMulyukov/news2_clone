class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :news
  has_many :categories
  has_many :votes
  has_many :comments

  validates :name, :presence => true
  validates_length_of :name, :in => 3..40
  validates_length_of :sex, :in => 2..6
end
