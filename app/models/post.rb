class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with PostValidator
  validates :title, presence: true
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category!" }
  validate :title_not_sufficiently_clickbaity

  def title_not_sufficiently_clickbaity
    clickbaity_titles = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    clickbaity_titles.any? do |t| 
      puts "#{t} : #{title} : #{title.to_s.include?(t)}"
    end
    if !( clickbaity_titles.any? { |t| title.to_s.include?(t) } ) then
      errors.add(:title, "is not sufficiently clickbaity!")
    end
  end
end
