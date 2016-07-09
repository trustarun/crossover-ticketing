class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.integer :issuer_user_id
      t.integer :assigned_to_id
      t.integer :category_id
      t.integer :status_id
      t.integer :priority_id
      t.datetime :due_date

      t.timestamps null: false
    end
  end
end
