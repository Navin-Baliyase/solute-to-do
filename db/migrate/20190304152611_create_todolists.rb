class CreateTodolists < ActiveRecord::Migration[5.2]
  def change
    create_table :todolists do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
