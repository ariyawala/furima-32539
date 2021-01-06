class CreateDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :details do |t|
      t.string     :age,       null: false
      t.integer    :gender_id, null: false
      t.integer    :genre1_id, null: false
      t.integer    :genre2_id, null: false
      t.integer    :genre3_id, null: false
      t.integer    :how_id,    null: false
      t.references :user
      t.timestamps
    end
  end
end
