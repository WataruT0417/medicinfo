module ReactionsHelper
  def filter_param(reaction, column, filter)
    if reaction.empty?
      filter
    end
    if filter.empty?
      "#{column} like \"\""
    else
      "#{filter} AND #{column} like \"%#{reaction}%"
    end
  end
end
