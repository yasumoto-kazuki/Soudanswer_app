class Gender < ActiveRecord::Base
  belongs_to :user
  has_many :gender_comments
end
