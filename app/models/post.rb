# frozen_string_literal: true

# Post
#
# Attributes:
#   body [text]
#   created_at [DateTime]
#   data [jsonb]
#   featured [boolean]
#   lead [text]
#   simple_image [references], optional
#   slug [string]
#   title [string]
#   updated_at [DateTime]
#   uuid [uuid]
class Post < ApplicationRecord
  include Checkable
  include HasUuid
  include HasSimpleImage
  include Toggleable

  TITLE_LIMIT = 255

  toggleable :featured

  before_validation { self.slug = Canonizer.transliterate(title) if slug.blank? }
  validates_presence_of :title, :lead, :body
  validates_length_of :title, maximum: TITLE_LIMIT

  scope :featured, -> { where(featured: true) }
  scope :recent, -> { order('id desc') }
  scope :list_for_visitors, -> { included_image.recent }
  scope :list_for_administration, -> { included_image.recent }

  # @param [Integer] page
  def self.page_for_visitors(page = 1)
    list_for_visitors.page(page)
  end

  # @param [Integer] page
  def self.page_for_administration(page = 1)
    list_for_administration.page(page)
  end

  def self.entity_parameters
    %i[body featured lead simple_image_id slug title]
  end

  def text_for_link
    title
  end

  def world_url
    "/posts/#{id}-#{slug}"
  end

  def adjacent
    {
      older: Post.where('id < ?', id).order('id desc').first,
      newer: Post.where('id > ?', id).order('id asc').first
    }
  end
end
