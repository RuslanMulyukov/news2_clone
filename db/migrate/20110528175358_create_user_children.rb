class CreateUserChildren < ActiveRecord::Migration
  def self.up
    create_table :user_children do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :user_children
  end
end
