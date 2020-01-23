class AddNameToColors < ActiveRecord::Migration[6.0]
  def change
    add_column :colors, :name, :string
  end
end
