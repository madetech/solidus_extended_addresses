class AddTitleToSpreeAddress < ActiveRecord::Migration
  def change
    add_column :spree_addresses, :title, :string
  end
end
