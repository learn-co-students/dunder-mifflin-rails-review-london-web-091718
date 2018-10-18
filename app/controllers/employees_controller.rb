class EmployeesController < ApplicationController
  # before_action :find_employee only: [:show]

  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
    @dogs = Dog.all
  end

  def create
    @employee = Employee.new(class_params)
    if @employee.valid?
      @employee.save
      redirect_to employee_path(@employee)
    else
      flash[:errors] = @employee.errors.full_messages
      redirect_to new_employee_path(@employee)
    end
  end

  private

  def class_params
    params.require(:employee).permit(
      :first_name,
      :last_name,
      :alias,
      :title,
      :office,
      :img_url,
      :dog_id
    )
  end

  def find_employee
    @employee = Employee.find(params[:id])
  end
end
