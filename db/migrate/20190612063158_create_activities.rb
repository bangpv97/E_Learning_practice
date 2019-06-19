class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.references :user, foreign_key: true
      t.references :action, polymorphic: true, index: true
      t.integer :target_type, null: false, default: 0

      t.timestamps
    end
  end
end
