class CreateBookmarksAndLists < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmarks_and_lists do |t|

      t.timestamps
    end
  end
end
