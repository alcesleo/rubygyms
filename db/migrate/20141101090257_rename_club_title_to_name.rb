class RenameClubTitleToName < ActiveRecord::Migration
  def change
    rename_column :clubs, :title, :name
  end
end
