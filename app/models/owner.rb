class Owner < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :dog_name, presence: true
  validates :email, presence: true

  def full_name
    #owner = Owner.find(params[:id])
    #Owner.first_name #+ " " + owner.last_name
   # Owner.find(params[:id])
    #Owner.first_name
    #Owner.find(params[:id])
    self.first_name + " " + self.last_name
  end

end
