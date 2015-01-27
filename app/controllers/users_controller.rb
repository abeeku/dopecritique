class UsersController < ApplicationController
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
end
