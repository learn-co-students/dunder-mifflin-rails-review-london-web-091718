class Dog < ApplicationRecord
has_many :employees


  def dog_emp
    employees = []
    Employee.all.each do |emp|
      if self.id == emp.dog_id.to_i
        employees << emp
      end
    end
    # employees.map do |emp|
    #     emp.first_name + " " + emp.last_name
    # end
    employees
  end



  # Employee.all.map {|e| }
end
