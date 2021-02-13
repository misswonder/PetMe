class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.references :breed, null: false, foreign_key: true
      t.string :name
      t.string :age
      t.string :gender
      t.string :size
      t.string :color
      t.boolean :good_with_children
      t.boolean :house_trained
      t.boolean :special_needs
      t.string :temperament

      t.timestamps
    end
  end
end
