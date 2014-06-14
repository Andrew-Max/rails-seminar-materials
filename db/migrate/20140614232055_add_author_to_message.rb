class AddAuthorToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :author_id, :integer
  end
end
