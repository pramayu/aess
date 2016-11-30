class Category < ActiveRecord::Base
  has_many :galleries

  validates :slug, uniqueness: true, presence: true
  before_validation :generate_slug


  def to_param
    slug
  end

  def generate_slug
    self.slug ||= name.parameterize
  end
end
