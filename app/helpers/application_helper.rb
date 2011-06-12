module ApplicationHelper
  
  def title
    base_title = "InTouch"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end 
  
  def logo
    image_tag("logo.png", :alt => "InTouch", :class => "round")
  end 
end
