class AddBookmarksUsersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :bookmark
    end
  end
end
