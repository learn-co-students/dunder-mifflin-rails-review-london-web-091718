class Employee < ApplicationRecord
  validates :alias, uniqueness: true
  validates :title, uniqueness: true
  belongs_to :dog

  def to_s
    "#{first_name} #{last_name}"
  end
end
