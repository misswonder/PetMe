class Conversation < ApplicationRecord
    belongs_to :sender, class_name: "User", foreign_key: "sender_id"
    belongs_to :recipient, class_name: "User", foreign_key: "recipient_id"
    has_many :messages, dependent: :destroy

    validates_uniqueness_of :sender_id, scope: :recipient_id

    scope :between, -> (sender_id,recipient_id) do
        where("(conversations.sender_id = ? AND conversations.recipient_id = ?) OR (conversations.recipient_id = ? AND conversations.sender_id = ?)", sender_id, recipient_id, sender_id, recipient_id)
    end

    def convo_recipient(current_user)
        self.sender_id == current_user.id ? self.recipient : self.sender
    end

    def unread_message_count(current_user)
        self.messages.where("user_id != ? AND read = ?", current_user.id, false).count
    end
end