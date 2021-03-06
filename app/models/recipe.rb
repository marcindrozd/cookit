class Recipe < ActiveRecord::Base
  has_many :recipe_categories
  has_many :categories, through: :recipe_categories
  has_many :favorites, dependent: :destroy
  belongs_to :creator, class_name: "User", foreign_key: "user_id"

  validates_presence_of :title, :directions, :ingredients

  mount_uploader :picture, PictureUploader

  def self.search_by_title(search_title)
    return [] if search_title.blank?
    where("lower(title) like ?", "%#{search_title.downcase}%").order(created_at: :desc)
  end

  def ingredients_list
    ingredients.split(";").map(&:strip)
  end
end
