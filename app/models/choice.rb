class Choice < ActiveRecord::Base
  belongs_to :query
  has_many :answers

  def name
    content
  end
end
