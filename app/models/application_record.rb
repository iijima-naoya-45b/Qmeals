# This is the ApplicationRecord class. It serves as the base class for all ActiveRecord models in the application.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
