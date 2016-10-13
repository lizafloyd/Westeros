class House < ApplicationRecord
  has_many :characters, dependents: :destroy
end
