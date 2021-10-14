class ShorthandUrl < ApplicationRecord

  validates :short_url, uniqueness: true

  default_scope { order(created_at: :desc) }

  before_save :generate_unique_url

  def generate_unique_url
    self.short_url = generate_unique_url_code
  end

end
