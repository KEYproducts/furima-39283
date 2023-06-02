module ItemsHelper
  def is_purchased?(item)
    if item.order != nil
      return true
    else
      return false
    end
  end

  def is_contributor?(item)
    if current_user.id == item.user.id
      return true
    else
      return false
    end
  end
end
