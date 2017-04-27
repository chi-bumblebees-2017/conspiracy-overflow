class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id, null: false
      t.string :body, null: false
      t.integer :responder_id, null: false
      t.boolean :favorited?, default: false

      t.timestamps( null: false)
    end
  end
end
