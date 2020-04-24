class CreateProducersMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :producers_movies do |t|
      t.references :person, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
