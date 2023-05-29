class CreateFilms < ActiveRecord::Migration[7.0]
  def change
    create_table :films do |t|
      t.string :title
      t.integer :release_year
      t.string :genre
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
