class Station < ApplicationRecord
  belongs_to :journey
  belongs_to :user
end
