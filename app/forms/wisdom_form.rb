class WisdomForm
  include ActiveModel::Model

  attr_accessor :title, :content, :tag_names, :photo, :image, :wisdom_attributes

  validates :title, presence: true, length: { maximum: 500 }
  validates :content, presence: true, length: { maximum: 500 }
  validates :tag_names, presence: true, length: { maximum: 500 }

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
      wisdom_board = WisdomBoard.create(title:, content:, photo:, user_id: @user.id)

      tag_objects = tag_names.map { |name| WisdomTag.find_or_create_by(name:) }
      wisdom_board.wisdom_tags << tag_objects

      @wisdom_attributes.each do |_, wisdom_board_params|
        image = wisdom_board_params['image']
        description = wisdom_board_params['description']
        if image.present? && description.present?
          WisdomPhoto.create(wisdom_board_id: wisdom_board.id, image:,
                             description:)
        end
      end
    end
    true
  rescue StandardError => e
    errors.add(:base, e.message)
    false
  end
end
