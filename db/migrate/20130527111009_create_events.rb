class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :organizer_name, :organizer_email
      t.string :title, unique: true
      t.date :date
    end
  end
end

