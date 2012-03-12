class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :response
      t.references :person
      t.references :question
      
      t.timestamps
    end
  end
end
