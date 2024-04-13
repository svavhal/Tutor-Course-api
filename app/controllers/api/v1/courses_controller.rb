# frozen_string_literal: true

module Api
  module V1
    # Controller to handle Course related CRUD operations.
    class CoursesController < ApplicationController
      # GET /courses
      def index
        courses = Course.includes(:tutors).paginate_if_requested(page: params[:page], per_page: params[:per_page])

        render json: V1::CourseSerializer.new(courses, serialization_options), status: :ok
      end

      # POST /courses
      def create
        course = Course.new(course_params)

        if course.save
          render json: V1::CourseSerializer.new(course, serialization_options), status: :created
        else
          render json: { errors: course.errors }, status: :unprocessable_entity
        end
      end

      private

      def course_params
        params.require(:course).permit(:name, :description, :code, tutors_attributes: %i[id name email bio _destroy])
      end

      def serialization_options
        { include: [:tutors] }
      end
    end
  end
end
