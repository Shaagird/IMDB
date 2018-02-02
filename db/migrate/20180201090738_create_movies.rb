class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.datetime :release_date
      t.string :description
      t.integer :rating

      t.timestamps
    end
  end
end
