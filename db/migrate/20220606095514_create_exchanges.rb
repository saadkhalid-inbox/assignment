class CreateExchanges < ActiveRecord::Migration[5.2]
  def change
    create_table :exchanges do |t|
      t.string :title
      t.numeric :usd_value

      t.timestamps
    end
  end
end
