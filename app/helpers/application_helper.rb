module ApplicationHelper

  def tag_parser(names_string)
    # split user-inputted tags string
    # iterate over comma-seperated list of tags
    # create tag for each
    names_array = names_string.split(",")
    names_array.map do |name|
      Tag.new(name: name)
    end
  end

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def intense?
    # user logged in
    if current_user
      # logged in user is a master
      current_user.master
    else
      # the user is not logged in
      false
    end
  end

end
