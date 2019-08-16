class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])  # ユーザーがポストした値を取り出し　find_by メソッドで　Userモデルを経由するDBから保存されている値と一致した場合に　user に代入=""
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end
  
  def destroy
    log_out
    redirect_to root_url, info: 'ログアウトしました'
  end

  private
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def session_params
    params.require(:session).permit(:email, :password)
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
