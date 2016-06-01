class CreateQuestionTags < ActiveRecord::Migration
  def change
    create_table :question_tags do |t|
      t.references :tag
      t.references :question

      t.timestamps null: false
    end
  end
end
