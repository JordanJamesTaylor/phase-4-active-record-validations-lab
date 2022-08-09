class Post < ApplicationRecord
    
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }

    validate :clickbait 

    def clickbait
        if title && !["Won't Believe", "Secret", "Top", "Guess"].any? { |phrase| title.include? phrase }
            errors.add(:title, "Title isn't sufficiently clickbait-y")
        end
    end
    
end