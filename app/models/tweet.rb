class Tweet < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :text, dependent: :destroy

  validates :title, presence: true
  validates :text, presence: true, unless: :was_attached?
  validates :hashtag, presence: true


  def was_attached?
    self.image.attached?
  end
end
