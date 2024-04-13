# frozen_string_literal: true

class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description, default: ''
      t.string :code, index: { unique: true }

      t.timestamps
    end
  end
end
