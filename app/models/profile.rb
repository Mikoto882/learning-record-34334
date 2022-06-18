class Profile < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :grade
end
