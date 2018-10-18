class EmployeesController < ApplicationController

  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  before_action :set_dog, only: [:new, :edit]

  def index
    @employees = Employee.all
  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.create(employee_params)
    if @employee.valid?
      redirect_to employee_url(@employee)
    else
      flash[:errors] = @employee.errors.full_messages
      redirect_to new_employee_url
    end
  end

  def update
    @employee.update(employee_params)
    if @employee.valid?
      redirect_to employee_url(@employee)
    else
      flash[:errors] = @employee.errors.full_messages
      redirect_to edit_employee_url
    end
  end

  def destroy
    @employee.delete
    redirect_to employees_url
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
  end

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def set_dog
    @dogs = Dog.all
  end
end
