class WisdomForm
  include ActiveModel::Model

  attr_accessor :title, :content, :tag_names, :photo, :wisdom_attributes
  attr_accessor :photo, :recipe_image

  validates :title, presence: true, length: { maximum: 140 }
  validates :content, presence: true, length: { maximum: 140 }
  validates :tag_names, presence: true, length: { maximum: 140 }
  validates :photo, presence: true

  mount_uploader :photo, WisdomPhotoUploader
  mount_uploader :image, WisdomImageUploader

  def initialize(attributes = {}, user)
    super(attributes)
    @user = user
    @wisdom_attributes = attributes[:wisdom_attributes] || {}
  end

  def tag_name=(tag_names)
    @tag_names = tag_names.split(',').map(&:strip).uniq
  end

  def save
    return false unless valid?

    ActiveRecord::Base.transaction do
      wisdom_board = WisdomBoard.create(title:, content:, photo:, user_id: @user.id) # 修正: wisdom_board の作成方法を修正

      tag_objects = tag_names.map { |name| WisdomTag.find_or_create_by(name:) }
      wisdom_board.wisdom_tags << tag_objects # 修正: wisdom_tags の関連付け方法を修正

      @wisdom_attributes.each do |_, wisdom_board_params|
        image = wisdom_board_params['image']
        description = wisdom_board_params['description']
        WisdomPhoto.create(wisdom_board_id: wisdom_board.id, image:, description:) if image.present? && description.present?
      end
    end
    true
  rescue StandardError => e
    errors.add(:base, e.message)
    false
  end
end
