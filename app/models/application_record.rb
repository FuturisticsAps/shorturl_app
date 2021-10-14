require 'safe_random'

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def generate_unique_url_code
    SafeRandom.token
  end

end
