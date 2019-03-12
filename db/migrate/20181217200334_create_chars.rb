class CreateChars < ActiveRecord::Migration[5.2]
  def change
    create_table :chars do |t|
      t.string :name
      t.integer :strength
      t.integer :perception
      t.integer :endurance
      t.integer :charisma
      t.integer :intelligence
      t.integer :agility
      t.integer :luck

      t.timestamps
    end
  end
end
