class AddLoginTimestampsToChefs < ActiveRecord::Migration
  def change
    add_column :chefs, :last_login, :datetime
  end
end
