class RenamePhotosToPhotoInBars < ActiveRecord::Migration[5.1]
  def change
    rename_column :bars, :photos, :photo
  end
end
