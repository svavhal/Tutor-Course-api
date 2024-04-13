# Course Management System

The Course Management System is a simple API developed using Ruby on Rails, designed to manage courses and their associated tutors. It provides a RESTful interface for creating courses with their respective tutors and listing all courses along with the tutors teaching them.

## System Dependencies

- **Ruby**: 3.1.4
- **Rails**: 6.1.7.7
- **Database**: sqlite3

Ensure you have the specified versions of Ruby and Rails installed on your system before proceeding with the setup.

## Installation

Clone the repository to your local environment:

```bash
git clone https://github.com/svavhal/Tutor-Course-api.git
cd your-repository-directory
```

Install the required gems:

```bash
bundle install
```

Setup your database:

```bash
rails db:create db:migrate
```

Run the server:

```bash
rails server
```

## Features

- **Create Course with Tutors**: Common POST API endpoint to create a course along with its associated tutors.
- **List Courses with Tutors**: GET API endpoint to retrieve a list of all courses with their assigned tutors.

## Usage

### Create a Course with Tutors

To create a new course with its tutors, make a POST request to `/api/v1/courses` with the following payload structure:

```json
{
  "course": {
    "name": "Ruby on Rails",
    "description": "Advanced rails concepts",
    "code": "RAILS1012",
    "tutors_attributes": [
      {
        "name": "Test Tutor",
        "email": "abc@gmail.com",
        "bio": "Short biography of the Tutor"
      }
    ]
  }
}
```

### List All Courses with Their Tutors

To retrieve all courses with their tutors, make a GET request to `/api/v1/courses`.

## Testing

The application includes RSpec test cases for both the `POST` and `GET` endpoints. To run the test suite, execute:

```bash
rspec
```

Ensure that all tests pass before making changes to the codebase.

## Postman Collection

A Postman collection containing pre-configured requests for the available API endpoints can be found in the repository with name 'course_tutor_api_collections.postman_collection.json'. Import this collection into Postman to quickly begin interacting with the API.