class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  before_action :set_dogs, only: [:new, :edit]
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
      redirect_to @employee
    else
      #byebug
      flash[:errors] = @employee.errors.full_messages
      redirect_to new_employee_path
      #render :new
    end
  end

  def edit

  end

  def update
    @employee.update(employee_params)
    if @employee.valid?
      redirect_to @employee
    else
      flash[:errors] = @employee.errors.full_messages
      redirect_to edit_employee_path(@employee)
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
  end

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def set_dogs
    @dogs = Dog.all
  end
end
