class Learn < ApplicationRecord
  validates :title, presence: true
  validates :subject_id, numericality: { other_than: 1 , message: "can't be blank" }

  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :subject
end
