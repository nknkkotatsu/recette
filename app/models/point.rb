class Point < ApplicationRecord
  belongs_to :worker
  belongs_to :recipe
end
