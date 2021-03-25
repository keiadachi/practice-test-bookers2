class UsersController < ApplicationController
  
  def index
    @user = current_user
    
    
  end

  def show
  end

  def edit
  end
  
private
  
  def ensure_correct_user
     @user = User.find(params[:id])
     unless @user == current_user
     redirect_to user_path(current_user)
     end
  end
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end
