class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :full_name
      t.string :business_name
      t.string :email
      t.string :tel_num

      t.timestamps
    end
  end
end
