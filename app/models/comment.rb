class Comment < ApplicationRecord
  belongs_to :worker
  belongs_to :idea
end
