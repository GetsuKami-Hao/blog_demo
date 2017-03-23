module SessionsHelper
  #存储需要查询的条件
  def store_search_str(str)
    session[:store_serach_str] = str
  end

  # 获得查询条件
  def get_search_str
    session[:store_serach_str]
  end

  #登陆当前用户
  def log_in(user)
    session[:user_id] = user.id
  end

  #返回当前用户
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end


  # 判断当前用户是否登陆
  def logged_in?
    !current_user.nil?
  end

  #　user 不是当前用户
  def isn_current_user?(user)
    current_user != user
  end

  # 进行动作前登陆用户
  def log_in_user
    if !logged_in?
      flash[:danger] = "please log in!"
      redirect_to login_url
    end
  end

  #用户退出
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

end
