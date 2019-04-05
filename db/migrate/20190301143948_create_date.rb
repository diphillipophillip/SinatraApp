class CreateDate < ActiveRecord::Migration[5.2]
  def change
    add_column :logs, :date, :string
  end
end
