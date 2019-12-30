class CreateCheckouts < ActiveRecord::Migration[5.0]
  def change
    create_table :checkouts do |t|
      t.integer :book_id
      t.integer :reader_id
      t.integer :rate
      t.date    :check_out_date
      t.date    :due_date
      t.date    :return_date
      
    end
  end
end
