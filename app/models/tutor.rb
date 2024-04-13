# frozen_string_literal: true

class Tutor < ApplicationRecord
  belongs_to :course
  validates :email, uniqueness: true
end
