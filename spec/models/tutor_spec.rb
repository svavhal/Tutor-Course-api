# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tutor do
  describe 'associations' do
    it { is_expected.to belong_to(:course) }
  end

  describe 'validations' do
    subject { build(:tutor) }

    it { is_expected.to validate_uniqueness_of(:email) }

    it 'is valid with a unique email' do
      create(:course)
      described_class.create!(course_id: Course.first.id, email: 'sandiptest@gmail.com')
      new_tutor = described_class.new(course_id: Course.first.id, email: 'abc@gmail.com')

      expect(new_tutor.valid?).to be(true)
    end

    it 'is invalid with a duplicate email' do
      create(:course)
      described_class.create!(course_id: Course.first.id, email: 'sandiptest@gmail.com')
      new_tutor = described_class.new(course_id: Course.first.id, email: 'sandiptest@gmail.com')

      expect(new_tutor.valid?).to be(false)
      expect(new_tutor.errors[:email].include?('has already been taken')).to be(true)
    end
  end
end
