class CreateMoviers < ActiveRecord::Migration[5.1]
  def change
    create_table :moviers do |t|
      t.string :title
      t.text :description
      t.date :year
      t.string :director
      t.text :actors

      t.timestamps
    end
  end
end
