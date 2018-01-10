class Post < ApplicationRecord
  validates :title, :sub, :image_url, presence: true

  before_validation :generate_image_url

  belongs_to :author,
  primary_key: 'id',
  foreign_key: 'user_id',
  class_name: 'User'

  belongs_to :sub

  def generate_image_url
    if self.title
      results = GoogleCustomSearchApi.search(self.title, {"searchType" => "image"})
      image_url = results['items'].first.link
      self.image_url = image_url
    end
    image_url
  end
end

# create_table :posts do |t|
#   t.string :title, null: false
#   t.string :url
#   t.text :content
#   t.integer :sub_id, null: false
#   t.integer :user_id, null: false
#
#   t.timestamps
# end
# add_index :posts, :sub_id
# add_index :posts, :user_id
# end
