module MedicinesHelper
  def filter_param(medicine, column, filter)
    if medicine.empty?
      filter
    end
    if filter.empty?
      "#{column} like \"\""
    else
      "#{filter} AND #{column} like \"%#{medicine}%"
    end
  end
end
