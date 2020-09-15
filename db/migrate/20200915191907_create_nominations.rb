class CreateNominations < ActiveRecord::Migration[6.0]
  def change
    create_table :nominations do |t|
      t.string :'1'
      t.string :'2'
      t.string :'3'
      t.string :'4'
      t.string :'5'
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
