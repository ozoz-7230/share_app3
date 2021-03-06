class UsersController < ApplicationController
  def dashboard
  end

  def show
    @user = User.find(params[:id])
    @rooms = @user.rooms
  end
  
  def update
    @user = current_user
    if @user.update(current_user_params)
      flash[:notice] = "保存しました"
    else
      flash[:alert] = "更新できません"
    end
    redirect_to dashboard_path
  end

 

    private

  def current_user_params
    params.require(:user).permit(:about, :status, :avatar)
  end

end
