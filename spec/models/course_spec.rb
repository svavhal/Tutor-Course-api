# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Course do
  # Test associations
  it { is_expected.to have_many(:tutors).dependent(:destroy) }

  # Test validations
  describe 'validations' do
    subject { create(:course) }

    it { is_expected.to validate_uniqueness_of(:code) }
    it { is_expected.to validate_presence_of(:name) }
  end

  # Test accepts_nested_attributes_for
  describe 'nested attributes' do
    it 'accepts nested attributes for tutors' do
      course = described_class.new(name: 'Java Programming', code: 'JAVA101', tutors_attributes: [{ name: 'Sandeep Vavhal' }])
      expect(course.tutors.first.name).to eq('Sandeep Vavhal')
    end
  end

  describe '.paginate_if_requested' do
    context 'when page and per_page parameters are present' do
      it 'paginates the courses' do
        # Create a total of 10 courses for example
        10.times do |i|
          described_class.create!(name: "Test Course #{i}", description: 'Test Description', code: "CODE#{i}")
        end

        # Request for the first 5 courses
        paginated_courses = described_class.paginate_if_requested(page: 1, per_page: 5)

        expect(paginated_courses.length).to eq(5)
      end
    end
  end
end
