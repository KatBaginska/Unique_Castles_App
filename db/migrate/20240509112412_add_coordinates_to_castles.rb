class AddCoordinatesToCastles < ActiveRecord::Migration[7.1]
  def change
    add_column :castles, :latitude, :float
    add_column :castles, :longitude, :float
  end
end
