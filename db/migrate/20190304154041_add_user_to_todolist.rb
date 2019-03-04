class AddUserToTodolist < ActiveRecord::Migration[5.2]
  def change
    add_reference :todolists, :user, foreign_key: true
  end
end
