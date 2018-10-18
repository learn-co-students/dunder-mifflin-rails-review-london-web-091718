class Employee < ApplicationRecord
  belongs_to :dog


  validates :alias, uniqueness: true
  validates :title, uniqueness: true

  def dog_inst
    dog = Dog.find(self.dog_id)

  end
end
