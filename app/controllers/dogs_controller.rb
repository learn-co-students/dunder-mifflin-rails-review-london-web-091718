class DogsController < ApplicationController

def show
  @dog=Dog.find(params[:id])
end

def index
  @dogs = Dog.all
end

def new
  @dog = Dog.new
end

def create
  @dog = Dog.create(dog_params)
  redirect_to dog_path
end

def edit
  @dog = Dog.find(params[:id])
end

def update
  @dog=Dog.find(params[:id])
  @dog.update(dog_params)
  redirect_to dog_path
end

def destroy
  @dog = Dog.find(params[:id])
  @dog.destroy
  redirect_to dogs_path
end

private

def dog_params
  params.require(:dog).permit(:name, :breed, :age, employee_ids: [])
end


end
