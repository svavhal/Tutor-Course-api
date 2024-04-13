# frozen_string_literal: true

class CreateTutors < ActiveRecord::Migration[6.1]
  def change
    create_table :tutors do |t|
      t.string :name
      t.string :email, index: { unique: true }
      t.text :bio, default: ''
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
