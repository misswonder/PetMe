class CreateBreeds < ActiveRecord::Migration[6.1]
  def change
    create_table :breeds do |t|
      t.string :species
      t.string :name

      t.timestamps
    end
  end
end
