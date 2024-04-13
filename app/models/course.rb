# frozen_string_literal: true

class Course < ApplicationRecord
  has_many :tutors, dependent: :destroy
  validates :code, uniqueness: true
  validates :name, presence: true
  accepts_nested_attributes_for :tutors

  def self.paginate_if_requested(page: nil, per_page: nil)
    if page && per_page
      # Using will_paginate for pagination
      paginate(page: page, per_page: per_page)
    else
      all
    end
  end
end
