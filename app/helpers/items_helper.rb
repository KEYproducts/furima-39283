module ItemsHelper
  def is_purchased?(item)
    return true unless item.order.nil?

    false
  end

  def is_contributor?(item)
    return true if current_user.id == item.user.id

    false
  end
end
