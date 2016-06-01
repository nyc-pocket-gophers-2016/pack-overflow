class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :body, null: false
      t.boolean :is_best, default: false
      t.references :question
      t.references :user

      t.timestamps null: false
    end
  end
end
