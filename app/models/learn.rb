class Learn < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true
  validates :subject_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :description, presence: true, unless: :was_attached?

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :subject

  def was_attached?
    self.image.attached?
  end
end
