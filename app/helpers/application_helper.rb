module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | RailsBricksBdd"      
    end
  end
end
