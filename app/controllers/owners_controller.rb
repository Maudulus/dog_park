class OwnersController < ApplicationController

  def index
    @owners = Owner.all
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)
    if @owner.save
      redirect_to @owner, notice: 'Owner was successfully created.'
    else
      render action: 'new'
    end
  end

  def show
    @owner = Owner.find(params[:id])
  end

  def destroy
    @owner = Owner.find(params[:id])
    @owner.destroy
    redirect_to owners_url
  end

  private

  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :dog_name, :email)
  end

end
