class CreateDecks < ActiveRecord::Migration[6.0]
  def change
    create_table :decks do |t|
      t.string :category
      t.string :title
      t.string :img_url

      t.timestamps
    end
  end
end
