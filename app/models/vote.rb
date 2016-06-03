class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, polymorphic: true

  validates :value, presence: true

  def type
    case votable_type
    when "Question"
      Vote.find_by
    when "Answer"
      Vote.create(value:1)
    when "Comment"
      Vote.find_by
    end
  end

end
