class Event < ActiveRecord::Base
  belongs_to :category
  has_many :galleries, dependent: :destroy
  belongs_to :user
  accepts_nested_attributes_for :galleries, reject_if: :all_blank, allow_destroy: true
end
