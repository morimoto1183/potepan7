class ChangeDatatypeTotalPriceOfResevations < ActiveRecord::Migration[5.2]
  def change
    change_column :reservations, :total_price, :integer
  end
end
