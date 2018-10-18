class DogsController < ApplicationController

  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
  end


  def new

  end

  def create

  end

  def edit

  end

  def update

  end



end
