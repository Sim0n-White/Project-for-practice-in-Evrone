class AddNickToChars < ActiveRecord::Migration[5.2]
  def change
    add_column :chars, :nick, :string
  end
end
