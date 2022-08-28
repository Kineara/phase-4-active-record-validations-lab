class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "is not included in the list"}
  validate :title_is_clickbait

  def title_is_clickbait
    if title
      unless title.include?("Won't Believe") || title.include?("Secret") || title.include?("Top") || title.include?("Guess")
        errors.add(:title, "no")
      end
    end
  end


end
