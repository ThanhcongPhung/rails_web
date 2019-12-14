class Discussion < ApplicationRecord

    belongs_to :chanel
    belongs_to :user
    has_many :replies,dependent: :destroy

    validates :title, :content, presence: true
end
