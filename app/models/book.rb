class Book < ApplicationRecord
  has_many :author_books
  has_many :authors, through: :author_books
  validates :title, presence: true

  def author_id=(author)
    self.authors << author
  end
end
