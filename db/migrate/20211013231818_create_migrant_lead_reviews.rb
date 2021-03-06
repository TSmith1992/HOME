class CreateMigrantLeadReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :migrant_lead_reviews do |t|

      t.belongs_to :migrant, null: false, foreign_key: true
      t.belongs_to :lead, null: false, foreign_key: true
      t.integer :score, default: 1, null: false
      t.text :review

      t.timestamps
    end
  end
end
