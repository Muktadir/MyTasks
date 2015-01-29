class PersonalInfo < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true
  validates :gender, presence: true
end
