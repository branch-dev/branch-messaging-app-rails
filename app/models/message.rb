class Message < ApplicationRecord
  belongs_to :customer
  belongs_to :agent, optional: true
end
