class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.date :date
      t.string :maindish
      t.string :okazu, array: true, default: []
      t.string :calorie

      t.timestamps
    end
  end
end
