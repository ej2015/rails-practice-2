class Post < ApplicationRecord
  enum category: { highbrow: 0, thoughtful: 1, pedestrian: 2, gutter: 3 }


  validates :title, :body, :category, presence: true

end
