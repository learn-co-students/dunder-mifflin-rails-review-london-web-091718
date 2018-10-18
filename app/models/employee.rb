class Employee < ApplicationRecord
  validates :alias, uniqueness:true
  validates :title, uniqueness:true
  belongs_to :dog


  def full_name
    self.first_name + " " + self.last_name
  end
end
