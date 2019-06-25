class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :event_type
      t.json :content

      t.timestamps
    end
  end
end
