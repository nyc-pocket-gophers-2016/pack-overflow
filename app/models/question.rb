class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :question_tags
  has_many :tags, through: :question_tags
  has_many :votes, as: :votable
  has_many :comments, as: :commentable

  validates :title, :body, presence: true

  def best_answer
    self.answers.find { |answer| answer.is_best }
    # this will be nil or the best answer
  end
end
