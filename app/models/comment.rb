class Comment < ApplicationRecord
  belongs_to :movier, optional: true
  belongs_to :user, optional: true
end
