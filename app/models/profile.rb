class Profile < ApplicationRecord
  validates :grade_id, numericality: { other_than: 1, message: "can't be blank" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :grade
end
