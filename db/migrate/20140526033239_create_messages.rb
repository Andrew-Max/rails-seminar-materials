class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :name
      t.string :email
      t.string :create_at
      t.string :datetime

      t.timestamps
    end
  end
end
