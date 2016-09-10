module ApplicationHelper

  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Ticketee").join(" - ")
      end # content_for
    end # unless
  end # title
  
  def admins_only(&block)
    block.call if current_user.try(:admin?)
  end # admins_only

end # ApplicationHelper
