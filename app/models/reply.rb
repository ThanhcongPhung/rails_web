class Reply < ApplicationRecord
  # mount_uploader :image, AvatarUploader
  belongs_to :discussion
  belongs_to :user
  validates :reply, presence: true
  has_one_attached	:image

  extend FriendlyId
  friendly_id :reply, use: [:slugged, :finders]

  def should_generate_new_friendly_id?
    reply_changed?
  end

end
