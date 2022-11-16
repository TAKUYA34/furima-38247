class CreateShiAdds < ActiveRecord::Migration[6.0]
  def change
    create_table :shi_adds do |t|
      t.string :post_code,             null: false
      t.integer :sender_id,            null: false
      t.string :locality,              null: false
      t.string :address,               null: false
      t.string :building
      t.string :phone,                 null: false
      t.references :order,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
