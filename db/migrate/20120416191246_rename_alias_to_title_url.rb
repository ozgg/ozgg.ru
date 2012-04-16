class RenameAliasToTitleUrl < ActiveRecord::Migration
  def change
    rename_column :posts, :alias, :title_url
  end
end
