class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :total_price
      t.integer :persons
      t.integer :many_days
      
      t.references :user, null: false, foreign_key: true  # 外部キーとしてuser_idで使う
      t.references :room, null: false, foreign_key: true  # 同上

      t.timestamps
    end
  end
end
