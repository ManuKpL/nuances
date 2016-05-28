class Query < ActiveRecord::Base
  belongs_to :theme
  has_many :answers
  has_many :choices
end
