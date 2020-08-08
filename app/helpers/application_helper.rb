module ApplicationHelper
  def flash_class(key)
    case key
      when "notice" then "alert-primary"
      when "success" then "alert-success"
      when "error" then "alert-danger"
      when "alert" then "alert-warning"
    end
  end
end
