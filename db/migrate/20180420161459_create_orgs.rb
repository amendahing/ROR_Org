class CreateOrgs < ActiveRecord::Migration[5.1]
  def change
    create_table :orgs do |t|
      t.string :name
      t.string :desc
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
