class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :email, null: false
      t.integer :rating
      t.text :comment
      t.references :movie
      t.timestamps
    end
  end
end
