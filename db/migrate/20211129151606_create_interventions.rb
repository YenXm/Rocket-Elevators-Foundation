class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.bigint :author
      t.references :employee, foreign_key: true
      t.references :customer, foreign_key: true
      t.references :building, foreign_key: true
      t.references :battery, foreign_key: true
      t.references :column, foreign_key: true
      t.references :elevator, foreign_key: true
      t.datetime :started_at, null: true
      t.datetime :ended_at, null: true
      t.string :result, default: 'Incomplete'
      t.string :report
      t.string :status, default: 'Pending'
    end
  end
end
