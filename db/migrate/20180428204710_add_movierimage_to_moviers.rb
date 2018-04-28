class AddMovierimageToMoviers < ActiveRecord::Migration[5.1]
  def change
    add_column :moviers, :movierimage, :string
  end
end
