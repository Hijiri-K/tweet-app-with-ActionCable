class Post < ApplicationRecord
  validates :content, {presence: true, length: {maximum: 140}}
  after_create_commit { MessageBroadcastJob.perform_later self }
end
