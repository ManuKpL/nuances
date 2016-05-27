class Theme < ActiveRecord::Base
  has_many :queries
  has_many :choices, through: :queries
  has_many :answers, through: :queries
end
