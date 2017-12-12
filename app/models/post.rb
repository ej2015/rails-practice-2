class Post < ApplicationRecord
  enum category: { highbrow: 0, thoughtful: 1, pedestrian: 2, gutter: 3 }


  validates :category, presence: true

end
