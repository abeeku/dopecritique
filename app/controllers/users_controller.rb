class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def new
    super
  end
  def edit
  	super
  end

def update
	super
end
   def create
     super
  end

  def show
  	 @user = User.find(params[:id])

    respond_to do |format|
        format.html # show.html.erb
        format.xml { render :xml => @user }
  end
 end 
def destroy
    # authorize! :delete, @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
 private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      accessible = [ :name, :email, :avatar, :picture] # extend with your own params
      accessible << [ :password, :password_confirmation] unless params[:user][:password].blank?
      params.require(:user).permit(accessible)
    end
end
