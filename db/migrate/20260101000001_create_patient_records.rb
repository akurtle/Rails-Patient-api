# frozen_string_literal: true

class CreatePatientRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :patient_records do |t|
      t.references :patient, null: false, foreign_key: { to_table: :users }
      t.string :summary, null: false
      t.string :diagnosis
      t.text :notes

      t.timestamps
    end
  end
end