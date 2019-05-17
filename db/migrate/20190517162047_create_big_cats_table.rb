class CreateBigCatsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :big_cats do |t|
      t.string :breed
      t.integer :average_age
      t.integer :length
      t.integer :weight
    end
  end
end
