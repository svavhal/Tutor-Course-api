# frozen_string_literal: true

module Api
  module V1
    # This serializer ensures that when Tutor data is requested, it is presented
    # in a consistent and easy-to-consume format for clients consuming the API.
    class TutorSerializer
      include JSONAPI::Serializer
      attributes :id, :name, :email, :bio
    end
  end
end
