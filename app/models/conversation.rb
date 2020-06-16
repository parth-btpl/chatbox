class Conversation < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User'


  # from rails guide - :scope option used to specify one or more attributes that are used to limit the uniqueness check
  validates :sender_id, uniqueness: { scope: :recipient_id }

  # returns an opposed user to the requested user
  def opposed_user(user)
    user == recipient ? sender : recipient
  end
end
