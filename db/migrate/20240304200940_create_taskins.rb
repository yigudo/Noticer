class CreateTaskins < ActiveRecord::Migration[7.1]
  def change
    create_table :taskins do |t|
      t.string :obj
      t.string :cooldown
      t.string :done

      t.timestamps
    end
  end
end
