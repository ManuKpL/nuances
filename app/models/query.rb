class Query < ActiveRecord::Base
  belongs_to :theme
  has_many :answers, dependent: :restrict_with_error
  has_many :choices, dependent: :destroy

  def name
    content
  end
end
