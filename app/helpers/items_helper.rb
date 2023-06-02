module ItemsHelper
  def purchased?(item)
    return true unless item.order.nil?

    false
  end

  def contributor?(item)
    return true if current_user.id == item.user.id

    false
  end
end
