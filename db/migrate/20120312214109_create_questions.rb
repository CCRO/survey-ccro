class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :prompt
      t.string :answer_method
      t.boolean :required
      t.references :survey
      t.timestamps
    end
  end
end
