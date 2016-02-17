class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.float :value

      t.timestamps
    end
  end
end
