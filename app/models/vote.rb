class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, polymorphic: true

  validates :value, presence: true

  def up
    
  end

  def down
  end
end
