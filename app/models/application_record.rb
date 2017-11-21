class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def error(column)
    errors[column].empty? ? nil : errors[column]
  end
  
end
