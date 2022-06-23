class Learn < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :image

  validates :title, presence: true
  validates :subject_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :description, presence: true, unless: :was_attached?

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :subject

  def was_attached?
    self.image.attached?
  end

  def self.search(search)
    if search != ""
      Learn.where('title LIKE(?)', "%#{search}%")
    else
      Learn.all
    end
  end
end
