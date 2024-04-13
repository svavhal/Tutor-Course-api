# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::CoursesController do
  let(:valid_attributes) do
    { name: 'Ruby Metaprogramming', description: 'Begineer guide in ruby Meta programming', code: 'RUBYMETA102' }
  end

  let(:invalid_attributes) do
    { name: '', description: '', code: '' }
  end

  let!(:tutors) { create_list(:tutor, 3) }

  describe 'GET /courses' do
    let!(:courses) { create_list(:course, 10, tutors: tutors) }

    it 'returns a successful response' do
      get '/api/v1/courses'
      expect(response).to have_http_status(:ok)
    end

    context 'with pagination parameters' do
      it 'paginates the results' do
        get '/api/v1/courses', params: { page: 2, per_page: 5 }

        json_response = JSON.parse(response.body)
        expect(json_response['data'].length).to eq(5)
      end
    end
  end

  describe 'POST /courses' do
    context 'with valid parameters' do
      it 'creates a new Course' do
        expect do
          post '/api/v1/courses', params: { course: valid_attributes }
        end.to change(Course, :count).by(1)
        expect(response).to have_http_status(:created)
      end

      it 'renders a JSON response with the new course' do
        post '/api/v1/courses', params: { course: valid_attributes }

        expect(response.content_type).to match(a_string_including('application/json'))
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Course' do
        expect do
          post '/api/v1/courses', params: { course: invalid_attributes }
        end.not_to change(Course, :count)
      end

      it 'renders a JSON response with errors for the new course' do
        post '/api/v1/courses', params: { course: invalid_attributes }

        expect(response.content_type).to match(a_string_including('application/json'))
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
