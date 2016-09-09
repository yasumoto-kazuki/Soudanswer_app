class Course < ActiveRecord::Base
  belongs_to :user
  has_many :course_comments
end
