# frozen_string_literal: true

module Api
  module V1
    # The V1::CourseSerializer class is designed to serialize Course objects for the version 1 of the API.
    class CourseSerializer
      include JSONAPI::Serializer
      attributes :id, :name, :description, :code
      has_many :tutors, serializer: Api::V1::TutorSerializer
    end
  end
end
