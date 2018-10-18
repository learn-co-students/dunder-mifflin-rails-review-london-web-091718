class AddDogIdToEmployees < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :dog_id, :string
  end
end
