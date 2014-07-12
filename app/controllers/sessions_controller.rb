class SessionsController < ActionController::Base
  before_filter :create_ldap_object, only: :create
  after_filter :clear_ldap_info, only: :create
  
  def new
  end
  
  def create
    user = User.find_by_netid(params[:netid])
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_url, notice: "Welcome back!"
    else
        redirect_to root_url, :alert => "Invalid username or password!"
    end
  end  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
  
  private
  
  def create_ldap_object
    @ldap = Net::LDAP.new
    @ldap.host = "ldap.cedar.uta.edu"
    @ldap.port = 636
    @ldap.base = 'cn=accounts, dc=uta, dc=edu'
    @ldap.encryption(:simple_tls)
    @results = []
  end

  def clear_ldap_info
    @ldap = nil
    @results = nil
  end
end
