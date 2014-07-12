module TasksHelper
  def user_list
    user_list = []
    User.all.each do |user| 
      user_list << [user.netid, user.id]
    end
    user_list
  end
end
