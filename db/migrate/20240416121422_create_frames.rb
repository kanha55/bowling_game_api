class CreateFrames < ActiveRecord::Migration[7.0]
  def change
    create_table :frames do |t|
      t.references :game, null: false, foreign_key: true
      t.integer :score
      t.timestamps
    end
  end
end
