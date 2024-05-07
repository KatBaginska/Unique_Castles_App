class AddImageUrlToCastles < ActiveRecord::Migration[7.1]
  def change
    add_column :castles, :image_url, :string
  end
end
