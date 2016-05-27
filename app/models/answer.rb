class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :query
  belongs_to :choice
end
