class Query < ActiveRecord::Base
  belongs_to :theme
  has_many :answers, dependent: :restrict_with_error
  has_many :choices, dependent: :destroy
  has_many :users, through: :answers

  def name
    content
  end
end
