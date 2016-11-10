class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

         has_many :studies
         has_many :courses
         has_many :genders
         has_many :comments
         has_many :course_comments
         has_many :gender_comments

         validates :gender, presence: true
         validates :grade, presence: true
         validates :nickname, presence: true

end
