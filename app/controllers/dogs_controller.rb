class DogsController < ApplicationController
  # before_action :find_dog only: [:show]

  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
  end

  private

  def class_params
    params.require(:dog).permit(:name, :breed, :age)
  end

  def find_dog
    @dog = Dog.find(params[:id])
  end
end
