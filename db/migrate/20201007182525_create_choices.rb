class CreateChoices < ActiveRecord::Migration[6.0]
  def change
    create_table :choices do |t|
      t.string :content
      t.string :img_url
      t.boolean :answer

      t.timestamps
    end
  end
end
