class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :message
      t.references :question
      t.references :answer
      t.references :user

      t.timestamps
    end
    add_index :responses, :question_id
    add_index :responses, :answer_id
    add_index :responses, :user_id
  end
end
