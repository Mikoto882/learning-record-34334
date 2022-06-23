class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :learns
  has_many :comments

  validates :nickname, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :grade
end
