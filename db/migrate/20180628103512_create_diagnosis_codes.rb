class CreateDiagnosisCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :diagnosis_codes do |t|
      t.string :code
      t.string :short_desc
      t.string :long_desc

      t.timestamps
    end
  end
end
