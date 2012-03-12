class AddPossibleResponsesToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :possible_responses, :text
  end
end
