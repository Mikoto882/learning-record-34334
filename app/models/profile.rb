class Profile < ApplicationRecord
  belongs_to :user


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :grade
end
