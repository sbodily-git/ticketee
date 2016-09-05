module ApplicationHelper

  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Ticketee").join(" - ")
      end # content_for
    end # unless
  end # title
  
end
