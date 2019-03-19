module DoubtsHelper
  def filter_param(doubt, column, filter)
    if doubt.empty?
      filter
    end
    if filter.empty?
      "#{column} like \"\""
    else
      "#{filter} AND #{column} like \"%#{doubt}%"
    end
  end
end
