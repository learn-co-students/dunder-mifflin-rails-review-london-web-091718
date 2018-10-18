class DogsController < ApplicationController

  before_action :set_dog, only: [:show, :edit, :update, :destroy]
  before_action :all_employees, only: [:new, :edit]

  def index
    @dogs = Dog.all
  end

  def show
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.create(dog_params)
    redirect_to dog_path(@dog)
  end

  def edit
  end

  def update
    @dog.update(dog_params)
    redirect_to dog_path(@dog)
  end

  def destroy
    @dog.destroy
    redirect_to dogs_path
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :age, employee_ids: [])
  end

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def all_employees
    @employees = Employee.all
  end

end
