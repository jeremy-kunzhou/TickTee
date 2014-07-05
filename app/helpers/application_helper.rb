module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Ticketeef").join(" - ")
      end
      p @titlet
    end
  end
end
