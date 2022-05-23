class CreateComics < ActiveRecord::Migration[7.0]
  def change
    create_table :comics do |t|
      t.string :month
      t.integer :num
      t.string :link
      t.string :year
      t.string :news
      t.string :safe_title
      t.text :transcript
      t.text :alt
      t.string :img
      t.string :title
      t.string :day

      t.timestamps
    end
  end
end
