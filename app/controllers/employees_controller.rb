class EmployeesController < ApplicationController
  before_action :set_dogs, only: [:index, :new, :create, :edit, :update]

    def index
      @employees = Employee.all
    end

    def show
      @employee = Employee.find(params[:id])
    end

    def edit
    end

    def new
      @employee = Employee.new
    end

    def create
      @employee = Employee.new(employee_params)
      if @employee.valid?
        @employee.save
        redirect_to employee_path(@employee)
      else
        render :new
      end
    end

    def update
      if @employee.update(employee_params)
        redirect_to employee_path(@employee)
      else
        render :edit
      end
    end

    def destroy
      @employee.destroy
    end

    private

    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id, :img_url)
    end

    def set_dogs
      @dogs = Dog.all
    end
end
