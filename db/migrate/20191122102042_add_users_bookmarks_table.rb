class AddUsersBookmarksTable < ActiveRecord::Migration[6.0]
  def change
    create_table :users_bookmarks, id: false do |t|
      t.belongs_to :user
      t.belongs_to :bookmark
    end
  end
end
