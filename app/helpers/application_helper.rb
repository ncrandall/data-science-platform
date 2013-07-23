module ApplicationHelper
  def current_user?(id)
    if !current_user.nil?
      current_user.id == id
    else
      false
    end
  end
end
