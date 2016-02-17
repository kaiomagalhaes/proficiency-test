class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.float :value
      t.belongs_to :student, index: true
      t.belongs_to :course, index: true

      t.timestamps
    end
  end
end
