class Message < ApplicationRecord
  validates :context, presence: true, length: { maximum: 100 }
  validates :userid, presence: true, length: { maximum: 10 }

  enum showable: {show: 1, hide: 0}
  enum status: { examine:2, active: 1, archived: 0}

end
