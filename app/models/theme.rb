class Theme < ActiveRecord::Base
  has_many :queries, dependent: :restrict_with_error
  has_many :choices, through: :queries
  has_many :answers, through: :queries
end
